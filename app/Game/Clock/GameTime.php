<?php

/*
 * The Religious Game (revival).
 * Based on "The Religious Game" by Enric Mogas Nonell, Jugando en .NET, 2004.
 * Licensed under the GNU Affero General Public License v3.0 or later. See LICENSE.
 */

declare(strict_types=1);

namespace App\Game\Clock;

use InvalidArgumentException;

/**
 * A moment in game time.
 *
 * Game time is one integer: hours since 1 January of year 0, 00:00. The game
 * uses a 365-day calendar without leap years (8,760 hours a year), as the
 * original did. Weekdays run on continuously from 1 January 1220, which was a
 * Wednesday in the Julian calendar.
 *
 * Each game day has 8 schedulable monastic hours of 2 game hours each, from
 * Matins (04:00) to Compline (18:00–20:00), and a fixed night from 20:00 to
 * 04:00 in which every monk sleeps.
 */
final readonly class GameTime
{
    public const HOURS_PER_DAY = 24;

    public const DAYS_PER_YEAR = 365;

    public const HOURS_PER_YEAR = self::HOURS_PER_DAY * self::DAYS_PER_YEAR; // 8,760

    public const START_YEAR = 1220;

    /** Days in each month of the game calendar (no leap years). */
    public const MONTH_LENGTHS = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];

    public const MONTH_NAMES = [
        'January', 'February', 'March', 'April', 'May', 'June',
        'July', 'August', 'September', 'October', 'November', 'December',
    ];

    public const WEEKDAY_NAMES = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];

    /** Weekday (0 = Sunday) of 1 January 1220 in the Julian calendar. */
    public const START_WEEKDAY = 3;

    /** Monastic hours: slug => first game hour of the day. Each lasts 2 hours. */
    public const PERIODS = [
        'matins' => 4,
        'lauds' => 6,
        'prime' => 8,
        'terce' => 10,
        'sext' => 12,
        'none' => 14,
        'vespers' => 16,
        'compline' => 18,
    ];

    public const NIGHT = 'night';

    public const NIGHT_STARTS_AT = 20;

    public const NIGHT_ENDS_AT = 4;

    public function __construct(public int $hour)
    {
        if ($hour < 0) {
            throw new InvalidArgumentException('Game time cannot be negative.');
        }
    }

    public static function fromDate(int $year, int $month = 1, int $day = 1, int $hourOfDay = 0): self
    {
        if ($month < 1 || $month > 12) {
            throw new InvalidArgumentException("Month must be 1–12, got {$month}.");
        }

        if ($day < 1 || $day > self::MONTH_LENGTHS[$month - 1]) {
            throw new InvalidArgumentException("Day {$day} does not exist in month {$month}.");
        }

        if ($hourOfDay < 0 || $hourOfDay > 23) {
            throw new InvalidArgumentException("Hour must be 0–23, got {$hourOfDay}.");
        }

        $dayOfYear = array_sum(array_slice(self::MONTH_LENGTHS, 0, $month - 1)) + $day - 1;

        return new self($year * self::HOURS_PER_YEAR + $dayOfYear * self::HOURS_PER_DAY + $hourOfDay);
    }

    /** 1 January 1220, 00:00: the start of every round. */
    public static function roundStart(): self
    {
        return self::fromDate(self::START_YEAR);
    }

    public function year(): int
    {
        return intdiv($this->hour, self::HOURS_PER_YEAR);
    }

    /** 0-based day within the year (0 = 1 January). */
    public function dayOfYear(): int
    {
        return intdiv($this->hour % self::HOURS_PER_YEAR, self::HOURS_PER_DAY);
    }

    /** 1–12 */
    public function month(): int
    {
        $remaining = $this->dayOfYear();

        foreach (self::MONTH_LENGTHS as $index => $length) {
            if ($remaining < $length) {
                return $index + 1;
            }

            $remaining -= $length;
        }

        return 12; // unreachable
    }

    /** 1–31 */
    public function day(): int
    {
        return $this->dayOfYear() - array_sum(array_slice(self::MONTH_LENGTHS, 0, $this->month() - 1)) + 1;
    }

    /** 0–23 */
    public function hourOfDay(): int
    {
        return $this->hour % self::HOURS_PER_DAY;
    }

    /** Days since 1 January of year 0. */
    public function dayNumber(): int
    {
        return intdiv($this->hour, self::HOURS_PER_DAY);
    }

    /** 0 = Sunday … 6 = Saturday */
    public function weekday(): int
    {
        $daysSinceStart = $this->dayNumber() - intdiv(self::roundStart()->hour, self::HOURS_PER_DAY);

        return ((self::START_WEEKDAY + $daysSinceStart) % 7 + 7) % 7;
    }

    public function weekdayName(): string
    {
        return self::WEEKDAY_NAMES[$this->weekday()];
    }

    public function monthName(): string
    {
        return self::MONTH_NAMES[$this->month() - 1];
    }

    /** Slug of the monastic hour, or "night". */
    public function period(): string
    {
        $hour = $this->hourOfDay();

        if ($hour >= self::NIGHT_STARTS_AT || $hour < self::NIGHT_ENDS_AT) {
            return self::NIGHT;
        }

        $current = self::NIGHT;

        foreach (self::PERIODS as $slug => $start) {
            if ($hour >= $start) {
                $current = $slug;
            }
        }

        return $current;
    }

    public function isNight(): bool
    {
        return $this->period() === self::NIGHT;
    }

    /** True in the first game hour of a monastic hour or of the night. */
    public function startsPeriod(): bool
    {
        $hour = $this->hourOfDay();

        return $hour === self::NIGHT_STARTS_AT || in_array($hour, self::PERIODS, true);
    }

    /** Meteorological season of the northern hemisphere. */
    public function season(): string
    {
        return match ($this->month()) {
            12, 1, 2 => 'winter',
            3, 4, 5 => 'spring',
            6, 7, 8 => 'summer',
            default => 'autumn',
        };
    }

    public function addHours(int $hours): self
    {
        return new self($this->hour + $hours);
    }

    /** e.g. "Wednesday 1 January 1220, 04:00 (matins)" */
    public function format(): string
    {
        return sprintf(
            '%s %d %s %d, %02d:00 (%s)',
            $this->weekdayName(),
            $this->day(),
            $this->monthName(),
            $this->year(),
            $this->hourOfDay(),
            $this->period(),
        );
    }
}
