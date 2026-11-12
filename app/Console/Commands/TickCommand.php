<?php

/*
 * The Religious Game (revival).
 * Based on "The Religious Game" by Enric Mogas Nonell, Jugando en .NET, 2004.
 * Licensed under the GNU Affero General Public License v3.0 or later. See LICENSE.
 */

declare(strict_types=1);

namespace App\Console\Commands;

use App\Game\Tick\TickPlan;
use App\Game\Tick\TickRunner;
use Illuminate\Console\Command;

class TickCommand extends Command
{
    protected $signature = 'game:tick
        {--max-hours=96 : Most game hours to process in one run}';

    protected $description = 'Process every game hour that has passed since the last tick';

    public function handle(TickRunner $runner): int
    {
        $option = $this->option('max-hours');
        $max = is_numeric($option) && (int) $option > 0 ? (int) $option : TickPlan::DEFAULT_MAX_HOURS_PER_RUN;
        $processed = $runner->run(maxHours: $max);

        if ($processed === null) {
            $this->warn('Another tick is still running; skipped.');

            return self::SUCCESS;
        }

        if ($processed === []) {
            $this->line('Nothing to do.');

            return self::SUCCESS;
        }

        $last = end($processed);
        $this->info(sprintf('Processed %d game hour(s), up to %s.', count($processed), $last->format()));

        return self::SUCCESS;
    }
}
