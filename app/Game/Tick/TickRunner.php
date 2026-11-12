<?php

/*
 * The Religious Game (revival).
 * Based on "The Religious Game" by Enric Mogas Nonell, Jugando en .NET, 2004.
 * Licensed under the GNU Affero General Public License v3.0 or later. See LICENSE.
 */

declare(strict_types=1);

namespace App\Game\Tick;

use App\Game\Clock\GameTime;
use App\Models\WorldClock;
use DateTimeInterface;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\DB;

/**
 * Advances the world: processes every game hour that has passed since the
 * last tick, one database transaction per hour, under a lock so two ticks
 * never overlap.
 */
final class TickRunner
{
    public const LOCK = 'game-tick';

    /**
     * @return list<GameTime>|null the hours processed, or null if another tick holds the lock
     */
    public function run(?DateTimeInterface $now = null, int $maxHours = TickPlan::DEFAULT_MAX_HOURS_PER_RUN): ?array
    {
        $lock = Cache::lock(self::LOCK, 300);

        if (! $lock->get()) {
            return null;
        }

        try {
            $clock = WorldClock::current();

            if ($clock === null || ! $clock->hasStarted($now)) {
                return [];
            }

            $current = $clock->math()->gameHourAt($now ?? Carbon::now());
            $hours = TickPlan::hoursToProcess($clock->last_processed_hour, $clock->start_game_hour, $current, $maxHours);
            $processed = [];

            foreach ($hours as $hour) {
                DB::transaction(function () use ($clock, $hour): void {
                    $time = new GameTime($hour);

                    GameHourProcessed::dispatch($time, $clock->id);

                    $clock->forceFill([
                        'last_processed_hour' => $hour,
                        'last_tick_at' => Carbon::now(),
                    ])->save();
                });

                $processed[] = new GameTime($hour);
            }

            return $processed;
        } finally {
            $lock->release();
        }
    }
}
