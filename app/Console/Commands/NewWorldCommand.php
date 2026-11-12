<?php

/*
 * The Religious Game (revival).
 * Based on "The Religious Game" by Enric Mogas Nonell, Jugando en .NET, 2004.
 * Licensed under the GNU Affero General Public License v3.0 or later. See LICENSE.
 */

declare(strict_types=1);

namespace App\Console\Commands;

use App\Game\Clock\GameTime;
use App\Game\Clock\WorldClockMath;
use App\Models\WorldClock;
use Illuminate\Console\Command;
use Illuminate\Support\Carbon;

class NewWorldCommand extends Command
{
    protected $signature = 'game:new-world
        {--now : Start immediately instead of at the next aligned start time}
        {--speed=4 : Game hours per real hour (the design uses 4)}
        {--force : Start a new round even if a world clock already exists}';

    protected $description = 'Start a world (or a new round) on 1 January 1220';

    public function handle(): int
    {
        $existing = WorldClock::current();

        if ($existing !== null && ! $this->option('force')) {
            $this->error('A world clock already exists. Use --force to start a new round (game state reset comes in a later milestone).');

            return self::FAILURE;
        }

        $speed = (float) $this->option('speed');

        if ($speed <= 0) {
            $this->error('--speed must be positive.');

            return self::FAILURE;
        }

        $epoch = $this->option('now')
            ? Carbon::now('UTC')->toDateTimeImmutable()
            : WorldClockMath::nextAlignedEpoch(Carbon::now(), config('game.timezone'));

        $clock = WorldClock::query()->create([
            'round_number' => ($existing?->round_number ?? 0) + 1,
            'epoch_at' => $epoch,
            'start_game_hour' => GameTime::roundStart()->hour,
            'game_hours_per_real_hour' => $speed,
        ]);

        $local = $epoch->setTimezone(new \DateTimeZone(config('game.timezone')));

        $this->info("Round {$clock->round_number} starts on 1 January 1220 at {$local->format('Y-m-d H:i T')}.");
        $this->line("One game hour lasts {$clock->math()->secondsPerGameHour()} real seconds.");

        return self::SUCCESS;
    }
}
