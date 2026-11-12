<?php

/*
 * The Religious Game (revival).
 * Based on "The Religious Game" by Enric Mogas Nonell, Jugando en .NET, 2004.
 * Licensed under the GNU Affero General Public License v3.0 or later. See LICENSE.
 */

declare(strict_types=1);

namespace App\Content;

use App\Models\Content\Translation;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;
use RuntimeException;

/**
 * Writes a checked ContentSet into the content tables.
 *
 * The whole load runs in one transaction. Existing content is replaced, but
 * translations entered by hand (source "manual") are kept.
 */
final class ContentImporter
{
    /** Content tables with a parent column pointing at the same table. */
    private const SELF_REFERENCING = [
        'resource_types' => 'parent_slug',
        'activities' => 'parent_slug',
    ];

    /** @return array<string, int> rows written per table */
    public function import(ContentSet $set, bool $replace = false): array
    {
        $errors = $set->errors();

        if ($errors !== []) {
            throw new RuntimeException("The content has errors and was not imported:\n- ".implode("\n- ", $errors));
        }

        if (! $replace && $this->hasContent()) {
            throw new RuntimeException('Content tables already hold data. Run again with --fresh to replace it (hand-made translations are kept).');
        }

        $now = Carbon::now();
        $written = [];

        // SQLite cannot switch foreign keys off inside a transaction, so the
        // switch wraps the transaction. Rows are also ordered parents first.
        Schema::withoutForeignKeyConstraints(function () use ($set, $now, &$written): void {
            DB::transaction(function () use ($set, $now, &$written): void {
                // Foreign keys stay on inside a transaction on SQLite (and in
                // tests), and RESTRICT is checked row by row, so a table that
                // points at itself cannot simply be emptied: unlink parents first.
                foreach (self::SELF_REFERENCING as $table => $column) {
                    DB::table($table)->update([$column => null]);
                }

                foreach (array_reverse(ContentSet::TABLE_ORDER) as $table) {
                    if ($table === 'translations') {
                        DB::table($table)->where('source', '!=', Translation::SOURCE_MANUAL)->delete();
                    } else {
                        DB::table($table)->delete();
                    }
                }

                foreach (ContentSet::TABLE_ORDER as $table) {
                    $written[$table] = $this->insert($table, $set->rows($table), $now);
                }
            });
        });

        return $written;
    }

    public function hasContent(): bool
    {
        return DB::table('building_types')->exists() || DB::table('resource_types')->exists();
    }

    /**
     * @param  list<array<string, mixed>>  $rows
     */
    private function insert(string $table, array $rows, Carbon $now): int
    {
        if ($rows === []) {
            return 0;
        }

        $columns = Schema::getColumnListing($table);
        $hasTimestamps = in_array('created_at', $columns, true);
        $count = 0;

        // Rows can have different keys (legacy and design rows); insert each
        // shape separately so missing columns fall back to their defaults.
        $groups = [];

        foreach ($rows as $row) {
            $row = array_intersect_key($row, array_flip($columns));

            if ($hasTimestamps) {
                $row['created_at'] = $now;
                $row['updated_at'] = $now;
            }

            $keys = array_keys($row);
            sort($keys);
            $groups[implode(',', $keys)][] = $row;
        }

        foreach ($groups as $group) {
            foreach (array_chunk($group, 500) as $chunk) {
                // Names may differ only by accents or case, which some
                // collations treat as equal; skip those quietly.
                $count += $table === 'names'
                    ? DB::table($table)->insertOrIgnore($chunk)
                    : (DB::table($table)->insert($chunk) ? count($chunk) : 0);
            }
        }

        return $count;
    }
}
