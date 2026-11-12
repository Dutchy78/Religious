<?php

/*
 * The Religious Game (revival).
 * Based on "The Religious Game" by Enric Mogas Nonell, Jugando en .NET, 2004.
 * Licensed under the GNU Affero General Public License v3.0 or later. See LICENSE.
 */

declare(strict_types=1);

namespace App\Content;

use App\Legacy\LegacyContentMapper;
use App\Legacy\SqlDumpReader;

/**
 * All game content to load: the recovered legacy content plus the revival's
 * design content, merged and checked.
 *
 * Framework independent, so the same checks run in plain PHP and in the
 * Laravel importer.
 */
final class ContentSet
{
    /**
     * Tables in load order (parents before children).
     */
    public const TABLE_ORDER = [
        'languages', 'units', 'orders', 'regions', 'region_climates', 'periods', 'ranks',
        'traits', 'trait_age_factors', 'resource_types', 'activities', 'building_types',
        'field_states', 'message_types', 'offices', 'building_costs', 'building_features',
        'field_state_transitions', 'transformations', 'recipes', 'activity_steps', 'event_types',
        'event_choices', 'parcel_types', 'names', 'translations',
    ];

    /**
     * Columns that point at another table's slug: column => target table.
     */
    public const REFERENCES = [
        'region_slug' => 'regions',
        'trait_slug' => 'traits',
        'resource_slug' => 'resource_types',
        'parent_slug' => null, // same table
        'unit_slug' => 'units',
        'activity_slug' => 'activities',
        'building_type_slug' => 'building_types',
        'required_building_slug' => 'building_types',
        'field_state_slug' => 'field_states',
        'from_state_slug' => 'field_states',
        'to_state_slug' => 'field_states',
        'becomes_resource_slug' => 'resource_types',
        'output_resource_slug' => 'resource_types',
        'input_resource_slug' => 'resource_types',
        'message_type_slug' => 'message_types',
        'event_type_slug' => 'event_types',
    ];

    /** @var array<string, list<array<string, mixed>>> */
    private array $tables = [];

    /** @var list<string> */
    private array $warnings = [];

    /** @var array<string, string|null> */
    private array $originalSettings = [];

    public static function build(SqlDumpReader $reader): self
    {
        $set = new self;
        $mapper = new LegacyContentMapper($reader);
        $legacy = $mapper->tables();
        $design = DesignContent::tables();

        foreach (self::TABLE_ORDER as $table) {
            $set->tables[$table] = [];
            $bySlug = [];

            foreach ([$legacy[$table] ?? [], $design[$table] ?? []] as $source) {
                foreach ($source as $row) {
                    if (isset($row['slug'])) {
                        // Design content wins over legacy rows with the same slug (orders, regions).
                        $bySlug[$row['slug']] = array_merge($bySlug[$row['slug']] ?? [], $row);

                        continue;
                    }

                    $set->tables[$table][] = $row;
                }
            }

            if ($bySlug !== []) {
                $set->tables[$table] = array_merge(array_values($bySlug), $set->tables[$table]);
            }
        }

        $set->tables['names'] = self::uniqueNames($set->tables['names']);

        foreach (['resource_types', 'activities'] as $table) {
            $set->tables[$table] = self::parentsFirst($set->tables[$table]);
        }
        $set->warnings = $mapper->warnings();
        $set->originalSettings = $mapper->originalSettings();

        return $set;
    }

    /** @return array<string, list<array<string, mixed>>> */
    public function tables(): array
    {
        return $this->tables;
    }

    /** @return list<array<string, mixed>> */
    public function rows(string $table): array
    {
        return $this->tables[$table] ?? [];
    }

    /** @return list<string> */
    public function warnings(): array
    {
        return $this->warnings;
    }

    /** @return array<string, string|null> */
    public function originalSettings(): array
    {
        return $this->originalSettings;
    }

    /**
     * Problems that would break the import: duplicate slugs and references
     * to slugs that do not exist.
     *
     * @return list<string>
     */
    public function errors(): array
    {
        $errors = [];
        $slugs = [];

        foreach ($this->tables as $table => $rows) {
            foreach ($rows as $row) {
                if (! isset($row['slug'])) {
                    continue;
                }

                if (isset($slugs[$table][$row['slug']])) {
                    $errors[] = "Duplicate slug '{$row['slug']}' in {$table}.";
                }

                $slugs[$table][$row['slug']] = true;
            }
        }

        foreach ($this->tables as $table => $rows) {
            foreach ($rows as $index => $row) {
                foreach (self::REFERENCES as $column => $target) {
                    $value = $row[$column] ?? null;

                    if ($value === null) {
                        continue;
                    }

                    $target ??= $table;

                    if (! isset($slugs[$target][$value])) {
                        $errors[] = "{$table} row {$index}: {$column} '{$value}' does not exist in {$target}.";
                    }
                }
            }
        }

        return $errors;
    }

    /** @return array<string, int> */
    public function counts(): array
    {
        return array_map('count', $this->tables);
    }

    /**
     * Orders a self-referencing table so every parent comes before its
     * children, so rows can be inserted with foreign keys switched on.
     *
     * @param  list<array<string, mixed>>  $rows
     * @return list<array<string, mixed>>
     */
    private static function parentsFirst(array $rows): array
    {
        $bySlug = array_column($rows, null, 'slug');
        $ordered = [];
        $placed = [];

        $place = function (string $slug, array $trail = []) use (&$place, &$ordered, &$placed, $bySlug): void {
            if (isset($placed[$slug]) || ! isset($bySlug[$slug]) || in_array($slug, $trail, true)) {
                return;
            }

            $parent = $bySlug[$slug]['parent_slug'] ?? null;

            if ($parent !== null) {
                $place($parent, [...$trail, $slug]);
            }

            $placed[$slug] = true;
            $ordered[] = $bySlug[$slug];
        };

        foreach (array_keys($bySlug) as $slug) {
            $place((string) $slug);
        }

        return $ordered;
    }

    /**
     * @param  list<array<string, mixed>>  $rows
     * @return list<array<string, mixed>>
     */
    private static function uniqueNames(array $rows): array
    {
        $unique = [];

        foreach ($rows as $row) {
            $unique[$row['kind'].'|'.$row['origin'].'|'.mb_strtolower((string) $row['name'])] ??= $row;
        }

        return array_values($unique);
    }
}
