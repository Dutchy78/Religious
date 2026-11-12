<?php

/*
 * The Religious Game (revival).
 * Based on "The Religious Game" by Enric Mogas Nonell, Jugando en .NET, 2004.
 * Licensed under the GNU Affero General Public License v3.0 or later. See LICENSE.
 */

declare(strict_types=1);

namespace App\Console\Commands;

use App\Content\ContentImporter;
use App\Content\ContentSet;
use App\Legacy\SqlDumpReader;
use Illuminate\Console\Command;
use Throwable;

class ImportLegacyCommand extends Command
{
    protected $signature = 'game:import-legacy
        {path? : Path to the religious_db dump (default: database/legacy/religious_db.sql)}
        {--fresh : Replace content that is already loaded (hand-made translations are kept)}
        {--dry-run : Read and check the dump, but write nothing}
        {--if-empty : Do nothing if content is already loaded (used on container start)}';

    protected $description = 'Load the original game content and the revival design content into the database';

    public function handle(ContentImporter $importer): int
    {
        if ($this->option('if-empty') && $importer->hasContent()) {
            $this->line('Game content is already loaded.');

            return self::SUCCESS;
        }

        $argument = $this->argument('path');
        $path = is_string($argument) && $argument !== '' ? $argument : database_path('legacy/religious_db.sql');

        try {
            $reader = SqlDumpReader::fromFile($path);
        } catch (Throwable $e) {
            $this->error($e->getMessage());

            return self::FAILURE;
        }

        $this->info("Read {$path} as {$reader->sourceEncoding()}.");

        $damaged = $reader->damagedValueCount();

        if ($damaged > 0) {
            $this->warn("{$damaged} text values in this dump lost their accents (shown as \u{FFFD}). Use the original Latin-1 dump to get them back.");
        }

        $set = ContentSet::build($reader);

        foreach ($set->warnings() as $warning) {
            $this->line("  <comment>note</comment> {$warning}");
        }

        $errors = $set->errors();

        if ($errors !== []) {
            foreach ($errors as $error) {
                $this->error($error);
            }

            return self::FAILURE;
        }

        if ($this->option('dry-run')) {
            $this->table(['Table', 'Rows'], collect($set->counts())->map(fn ($n, $t) => [$t, $n])->values()->all());
            $this->info('Dry run: nothing written.');

            return self::SUCCESS;
        }

        try {
            $written = $importer->import($set, (bool) $this->option('fresh'));
        } catch (Throwable $e) {
            $this->error($e->getMessage());

            return self::FAILURE;
        }

        $this->table(['Table', 'Rows'], collect($written)->map(fn ($n, $t) => [$t, $n])->values()->all());
        $this->info('Content imported.');

        return self::SUCCESS;
    }
}
