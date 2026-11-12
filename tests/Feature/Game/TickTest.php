<?php

/*
 * The Religious Game (revival).
 * Based on "The Religious Game" by Enric Mogas Nonell, Jugando en .NET, 2004.
 * Licensed under the GNU Affero General Public License v3.0 or later. See LICENSE.
 */

namespace Tests\Feature\Game;

use App\Game\Clock\GameTime;
use App\Game\Tick\GameHourProcessed;
use App\Models\WorldClock;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Support\Facades\Event;
use Tests\TestCase;

class TickTest extends TestCase
{
    use RefreshDatabase;

    public function test_a_new_world_starts_on_1_january_1220(): void
    {
        $this->artisan('game:new-world', ['--now' => true])->assertSuccessful();

        $clock = WorldClock::current();

        $this->assertNotNull($clock);
        $this->assertSame(1, $clock->round_number);
        $this->assertSame(GameTime::roundStart()->hour, $clock->now()->hour);
        $this->artisan('game:new-world', ['--now' => true])->assertFailed(); // needs --force
    }

    public function test_the_tick_processes_every_passed_hour_once(): void
    {
        Event::fake([GameHourProcessed::class]);

        $this->artisan('game:new-world', ['--now' => true])->assertSuccessful();

        $this->travel(1)->hours(); // 4 game hours later
        $this->artisan('game:tick')->assertSuccessful();

        // Hours 0..4 of 1 January 1220 (the start hour counts too)
        Event::assertDispatchedTimes(GameHourProcessed::class, 5);
        $this->assertSame(GameTime::roundStart()->hour + 4, WorldClock::current()->last_processed_hour);

        $this->artisan('game:tick')->assertSuccessful();
        Event::assertDispatchedTimes(GameHourProcessed::class, 5); // nothing new

        $this->travel(15)->minutes();
        $this->artisan('game:tick')->assertSuccessful();
        Event::assertDispatchedTimes(GameHourProcessed::class, 6);
    }

    public function test_the_clock_command_shows_the_time(): void
    {
        $this->artisan('game:clock')->assertSuccessful();

        $this->artisan('game:new-world', ['--now' => true]);
        $this->artisan('game:clock')->expectsOutputToContain('1 January 1220')->assertSuccessful();
    }
}
