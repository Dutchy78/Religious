<?php

/*
 * The Religious Game (revival).
 * Based on "The Religious Game" by Enric Mogas Nonell, Jugando en .NET, 2004.
 * Licensed under the GNU Affero General Public License v3.0 or later. See LICENSE.
 */

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

/**
 * The game clock of a world. Game time is an integer: hours since year 0.
 * The current game hour is derived from real time, so the clock never
 * drifts; the tick records how far it has processed.
 */
return new class extends Migration
{
    public function up(): void
    {
        Schema::create('world_clocks', function (Blueprint $table) {
            $table->id();
            $table->unsignedInteger('round_number')->default(1);
            $table->dateTime('epoch_at');                  // real time (UTC) at which the round started
            $table->unsignedBigInteger('start_game_hour'); // game hour at epoch_at (1 January 1220, 00:00)
            $table->decimal('game_hours_per_real_hour', 6, 2)->default(4);
            $table->unsignedBigInteger('last_processed_hour')->nullable();
            $table->dateTime('last_tick_at')->nullable();
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('world_clocks');
    }
};
