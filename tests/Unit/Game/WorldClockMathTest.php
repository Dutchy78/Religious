<?php

/*
 * The Religious Game (revival).
 * Based on "The Religious Game" by Enric Mogas Nonell, Jugando en .NET, 2004.
 * Licensed under the GNU Affero General Public License v3.0 or later. See LICENSE.
 */

declare(strict_types=1);

namespace Tests\Unit\Game;

use App\Game\Clock\GameTime;
use App\Game\Clock\WorldClockMath;
use App\Game\Tick\TickPlan;
use DateTimeImmutable;
use DateTimeZone;
use PHPUnit\Framework\TestCase;

class WorldClockMathTest extends TestCase
{
    private function clock(): WorldClockMath
    {
        return new WorldClockMath(
            new DateTimeImmutable('2026-12-01 04:00:00', new DateTimeZone('UTC')), // 05:00 in Amsterdam (winter)
            GameTime::roundStart()->hour,
        );
    }

    public function test_one_game_hour_is_fifteen_real_minutes(): void
    {
        $clock = $this->clock();
        $start = GameTime::roundStart()->hour;

        $this->assertSame(900, $clock->secondsPerGameHour());
        $this->assertSame($start, $clock->gameHourAt(new DateTimeImmutable('2026-12-01 04:14:59', new DateTimeZone('UTC'))));
        $this->assertSame($start + 1, $clock->gameHourAt(new DateTimeImmutable('2026-12-01 04:15:00', new DateTimeZone('UTC'))));
    }

    public function test_four_game_days_per_real_day_and_a_year_in_about_three_months(): void
    {
        $clock = $this->clock();
        $start = GameTime::roundStart()->hour;

        $this->assertSame($start + 4 * 24, $clock->gameHourAt(new DateTimeImmutable('2026-12-02 04:00:00', new DateTimeZone('UTC'))));

        $yearEnd = $clock->realTimeOf($start + GameTime::HOURS_PER_YEAR);
        $this->assertSame('2027-03-02', $yearEnd->format('Y-m-d')); // 91.25 real days later
    }

    public function test_matins_starts_at_06_00_amsterdam_and_night_at_10_00(): void
    {
        $clock = $this->clock();
        $zone = new DateTimeZone('Europe/Amsterdam');
        $start = GameTime::roundStart()->hour;

        $this->assertSame('06:00', $clock->realTimeOf($start + 4)->setTimezone($zone)->format('H:i'));   // Matins
        $this->assertSame('09:30', $clock->realTimeOf($start + 18)->setTimezone($zone)->format('H:i'));  // Compline
        $this->assertSame('10:00', $clock->realTimeOf($start + 20)->setTimezone($zone)->format('H:i'));  // night
        $this->assertSame('12:00', $clock->realTimeOf($start + 28)->setTimezone($zone)->format('H:i'));  // next Matins
    }

    public function test_before_the_epoch_the_clock_waits_at_the_start(): void
    {
        $this->assertSame(GameTime::roundStart()->hour, $this->clock()->gameHourAt(new DateTimeImmutable('2026-11-30 12:00:00', new DateTimeZone('UTC'))));
    }

    public function test_next_aligned_epoch(): void
    {
        $utc = new DateTimeZone('UTC');

        // 19:37 in Amsterdam (UTC+1) -> next day start is 23:00 Amsterdam = 22:00 UTC
        $this->assertSame('2026-11-12 22:00', WorldClockMath::nextAlignedEpoch(new DateTimeImmutable('2026-11-12 18:37:00', $utc))->format('Y-m-d H:i'));
        // 23:30 Amsterdam -> 05:00 next day = 04:00 UTC
        $this->assertSame('2026-11-13 04:00', WorldClockMath::nextAlignedEpoch(new DateTimeImmutable('2026-11-12 22:30:00', $utc))->format('Y-m-d H:i'));
        // exactly on a start time counts
        $this->assertSame('2026-11-12 10:00', WorldClockMath::nextAlignedEpoch(new DateTimeImmutable('2026-11-12 10:00:00', $utc))->format('Y-m-d H:i'));
    }

    public function test_tick_plan_catches_up_and_caps(): void
    {
        $this->assertSame([100, 101, 102], TickPlan::hoursToProcess(null, 100, 102));
        $this->assertSame([103, 104], TickPlan::hoursToProcess(102, 100, 104));
        $this->assertSame([], TickPlan::hoursToProcess(104, 100, 104));
        $this->assertCount(96, TickPlan::hoursToProcess(null, 0, 10_000));
        $this->assertSame([5, 6], TickPlan::hoursToProcess(4, 0, 10_000, maxHours: 2));
    }
}
