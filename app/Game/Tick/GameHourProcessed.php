<?php

/*
 * The Religious Game (revival).
 * Based on "The Religious Game" by Enric Mogas Nonell, Jugando en .NET, 2004.
 * Licensed under the GNU Affero General Public License v3.0 or later. See LICENSE.
 */

declare(strict_types=1);

namespace App\Game\Tick;

use App\Game\Clock\GameTime;
use Illuminate\Foundation\Events\Dispatchable;

/**
 * Fired once for every game hour, inside that hour's database transaction.
 *
 * Milestone 2 adds the listeners that resolve monk activities when a
 * monastic hour starts and run the daily work when the night starts.
 */
final class GameHourProcessed
{
    use Dispatchable;

    public function __construct(
        public readonly GameTime $time,
        public readonly int $worldClockId,
    ) {}
}
