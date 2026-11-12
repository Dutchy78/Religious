<?php

/*
 * The Religious Game (revival).
 * Based on "The Religious Game" by Enric Mogas Nonell, Jugando en .NET, 2004.
 * Licensed under the GNU Affero General Public License v3.0 or later. See LICENSE.
 */

declare(strict_types=1);

namespace App\Game\Clock;

use DateTimeImmutable;
use DateTimeInterface;
use DateTimeZone;
use InvalidArgumentException;

/**
 * Converts between real time and game time for one round.
 *
 * Decided in the design document: each monastic hour lasts 30 real minutes
 * and the night 2 real hours, so 1 game hour = 15 real minutes, 1 game day =
 * 6 real hours, 4 game days per real day and one game year (a round) is
 * about 91 real days.
 *
 * The current game hour is always derived from real time, so the clock
 * never drifts and a server that was down simply catches up.
 */
final readonly class WorldClockMath
{
    public const DEFAULT_GAME_HOURS_PER_REAL_HOUR = 4.0;

    /**
     * Real local times at which a game day starts (game 00:00), so that
     * Matins (game 04:00) begins at 06:00, 12:00, 18:00 and 00:00 and the
     * nights fall at 04–06, 10–12, 16–18 and 22–24, as in the design.
     */
    public const DAY_START_REAL_HOURS = [5, 11, 17, 23];

    public function __construct(
        public DateTimeImmutable $epoch,
        public int $startGameHour,
        public float $gameHoursPerRealHour = self::DEFAULT_GAME_HOURS_PER_REAL_HOUR,
    ) {
        if ($gameHoursPerRealHour <= 0) {
            throw new InvalidArgumentException('Game speed must be positive.');
        }
    }

    /** The game hour that is current at the given real moment. */
    public function gameHourAt(DateTimeInterface $now): int
    {
        $elapsedSeconds = $now->getTimestamp() - $this->epoch->getTimestamp();

        if ($elapsedSeconds < 0) {
            return $this->startGameHour; // the round has not started yet
        }

        return $this->startGameHour + intdiv($elapsedSeconds * (int) round($this->gameHoursPerRealHour * 1000), 3_600_000);
    }

    public function gameTimeAt(DateTimeInterface $now): GameTime
    {
        return new GameTime($this->gameHourAt($now));
    }

    /** The real moment at which a game hour begins. */
    public function realTimeOf(int $gameHour): DateTimeImmutable
    {
        $seconds = (int) round(($gameHour - $this->startGameHour) * 3600 / $this->gameHoursPerRealHour);

        return $this->epoch->modify(sprintf('%+d seconds', $seconds));
    }

    /** Real seconds that one game hour lasts (900 at the default speed). */
    public function secondsPerGameHour(): int
    {
        return (int) round(3600 / $this->gameHoursPerRealHour);
    }

    /**
     * The next real moment, at or after $from, at which a game day can start
     * so the monastic hours line up with the times in the design document.
     */
    public static function nextAlignedEpoch(DateTimeInterface $from, string $timezone = 'Europe/Amsterdam'): DateTimeImmutable
    {
        $zone = new DateTimeZone($timezone);
        $local = DateTimeImmutable::createFromInterface($from)->setTimezone($zone);

        for ($day = 0; $day <= 1; $day++) {
            foreach (self::DAY_START_REAL_HOURS as $hour) {
                $candidate = $local->modify("+{$day} day")->setTime($hour, 0);

                if ($candidate >= $local) {
                    return $candidate->setTimezone(new DateTimeZone('UTC'));
                }
            }
        }

        throw new \LogicException('No aligned start time found.'); // unreachable
    }
}
