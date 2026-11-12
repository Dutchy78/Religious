<?php

/*
 * The Religious Game (revival).
 * Based on "The Religious Game" by Enric Mogas Nonell, Jugando en .NET, 2004.
 * Licensed under the GNU Affero General Public License v3.0 or later. See LICENSE.
 */

declare(strict_types=1);

namespace Tests\Unit\Game;

use App\Game\Clock\GameTime;
use PHPUnit\Framework\TestCase;

class GameTimeTest extends TestCase
{
    public function test_round_starts_on_wednesday_1_january_1220(): void
    {
        $start = GameTime::roundStart();

        $this->assertSame(1220 * 8760, $start->hour);
        $this->assertSame(1220, $start->year());
        $this->assertSame(1, $start->month());
        $this->assertSame(1, $start->day());
        $this->assertSame('Wednesday', $start->weekdayName());
        $this->assertSame('winter', $start->season());
    }

    public function test_calendar_has_365_days_and_no_leap_years(): void
    {
        $lastHour = GameTime::fromDate(1220, 12, 31, 23);

        $this->assertSame(1220, $lastHour->year());
        $this->assertSame(364, $lastHour->dayOfYear());
        $this->assertSame(1221, $lastHour->addHours(1)->year());
        $this->assertSame(28, GameTime::MONTH_LENGTHS[1]);
    }

    public function test_dates_round_trip(): void
    {
        foreach ([[1220, 4, 14, 10], [1220, 2, 28, 0], [1221, 12, 31, 23], [1220, 7, 1, 19]] as [$y, $m, $d, $h]) {
            $time = GameTime::fromDate($y, $m, $d, $h);

            $this->assertSame([$y, $m, $d, $h], [$time->year(), $time->month(), $time->day(), $time->hourOfDay()]);
        }
    }

    public function test_monastic_hours_and_night(): void
    {
        $expected = [
            0 => 'night', 3 => 'night', 4 => 'matins', 5 => 'matins', 6 => 'lauds', 8 => 'prime',
            10 => 'terce', 12 => 'sext', 14 => 'none', 16 => 'vespers', 18 => 'compline', 19 => 'compline',
            20 => 'night', 23 => 'night',
        ];

        foreach ($expected as $hour => $period) {
            $this->assertSame($period, GameTime::fromDate(1220, 3, 1, $hour)->period(), "hour {$hour}");
        }
    }

    public function test_period_starts(): void
    {
        $starts = [];

        for ($hour = 0; $hour < 24; $hour++) {
            if (GameTime::fromDate(1220, 3, 1, $hour)->startsPeriod()) {
                $starts[] = $hour;
            }
        }

        // 8 monastic hours + the start of the night
        $this->assertSame([4, 6, 8, 10, 12, 14, 16, 18, 20], $starts);
    }

    public function test_weekdays_continue_across_years(): void
    {
        $this->assertSame('Thursday', GameTime::fromDate(1220, 1, 2)->weekdayName());
        $this->assertSame('Wednesday', GameTime::fromDate(1220, 1, 8)->weekdayName());
        // 365 days later = 52 weeks + 1 day
        $this->assertSame('Thursday', GameTime::fromDate(1221, 1, 1)->weekdayName());
    }

    public function test_seasons(): void
    {
        $this->assertSame('spring', GameTime::fromDate(1220, 4, 14)->season());
        $this->assertSame('summer', GameTime::fromDate(1220, 8, 31)->season());
        $this->assertSame('autumn', GameTime::fromDate(1220, 9, 1)->season());
        $this->assertSame('winter', GameTime::fromDate(1220, 12, 1)->season());
    }

    public function test_format(): void
    {
        $this->assertSame('Wednesday 1 January 1220, 04:00 (matins)', GameTime::fromDate(1220, 1, 1, 4)->format());
    }

    public function test_rejects_impossible_dates(): void
    {
        $this->expectException(\InvalidArgumentException::class);

        GameTime::fromDate(1220, 2, 29);
    }
}
