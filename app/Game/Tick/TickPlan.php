<?php

/*
 * The Religious Game (revival).
 * Based on "The Religious Game" by Enric Mogas Nonell, Jugando en .NET, 2004.
 * Licensed under the GNU Affero General Public License v3.0 or later. See LICENSE.
 */

declare(strict_types=1);

namespace App\Game\Tick;

/**
 * Which game hours a tick must process: every hour after the last processed
 * one, up to and including the current hour, capped so one run cannot take
 * forever after a long outage (the next run continues where it stopped).
 */
final readonly class TickPlan
{
    public const DEFAULT_MAX_HOURS_PER_RUN = 96; // one real day at the default speed

    /**
     * @return list<int> game hours to process, in order
     */
    public static function hoursToProcess(?int $lastProcessed, int $startHour, int $currentHour, int $maxHours = self::DEFAULT_MAX_HOURS_PER_RUN): array
    {
        $first = $lastProcessed === null ? $startHour : $lastProcessed + 1;

        if ($currentHour < $first || $maxHours < 1) {
            return [];
        }

        return range($first, min($currentHour, $first + $maxHours - 1));
    }
}
