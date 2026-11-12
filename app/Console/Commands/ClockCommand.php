<?php

/*
 * The Religious Game (revival).
 * Based on "The Religious Game" by Enric Mogas Nonell, Jugando en .NET, 2004.
 * Licensed under the GNU Affero General Public License v3.0 or later. See LICENSE.
 */

declare(strict_types=1);

namespace App\Console\Commands;

use App\Game\Clock\GameTime;
use App\Models\WorldClock;
use Illuminate\Console\Command;
use Illuminate\Support\Carbon;

class ClockCommand extends Command
{
    protected $signature = 'game:clock';

    protected $description = 'Show the current game time';

    public function handle(): int
    {
        $clock = WorldClock::current();

        if ($clock === null) {
            $this->warn('No world yet. Run php artisan game:new-world first.');

            return self::SUCCESS;
        }

        $zone = new \DateTimeZone(config('game.timezone'));
        $now = $clock->now();
        $next = $now->addHours(1);

        while (! $next->startsPeriod()) {
            $next = $next->addHours(1);
        }

        $nextReal = $clock->math()->realTimeOf($next->hour)->setTimezone($zone);

        $this->table(['', ''], [
            ['Round', (string) $clock->round_number],
            ['Started', $clock->hasStarted() ? 'yes' : 'not yet, starts '.Carbon::instance($clock->epoch_at)->setTimezone($zone)->format('Y-m-d H:i T')],
            ['Game time', $now->format()],
            ['Season', $now->season()],
            ['Next', $next->period().' at '.$nextReal->format('H:i T')],
            ['Last processed', $clock->last_processed_hour === null ? 'never' : (new GameTime($clock->last_processed_hour))->format()],
        ]);

        return self::SUCCESS;
    }
}
