<?php

/*
 * The Religious Game (revival).
 * Based on "The Religious Game" by Enric Mogas Nonell, Jugando en .NET, 2004.
 * Licensed under the GNU Affero General Public License v3.0 or later. See LICENSE.
 */

declare(strict_types=1);

namespace App\Models;

use App\Game\Clock\GameTime;
use App\Game\Clock\WorldClockMath;
use DateTimeImmutable;
use DateTimeInterface;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Carbon;

/**
 * The clock of the running world. There is one row per world; the game uses
 * the latest one.
 *
 * @property int $id
 * @property int $round_number
 * @property Carbon $epoch_at
 * @property int $start_game_hour
 * @property float $game_hours_per_real_hour
 * @property int|null $last_processed_hour
 * @property Carbon|null $last_tick_at
 */
class WorldClock extends Model
{
    protected $guarded = [];

    protected function casts(): array
    {
        return [
            'epoch_at' => 'datetime',
            'last_tick_at' => 'datetime',
            'start_game_hour' => 'integer',
            'last_processed_hour' => 'integer',
            'game_hours_per_real_hour' => 'float',
        ];
    }

    public static function current(): ?self
    {
        return static::query()->latest('id')->first();
    }

    public function math(): WorldClockMath
    {
        return new WorldClockMath(
            DateTimeImmutable::createFromInterface($this->epoch_at),
            $this->start_game_hour,
            $this->game_hours_per_real_hour,
        );
    }

    public function now(?DateTimeInterface $at = null): GameTime
    {
        return $this->math()->gameTimeAt($at ?? Carbon::now());
    }

    public function hasStarted(?DateTimeInterface $at = null): bool
    {
        return ($at ?? Carbon::now())->getTimestamp() >= $this->epoch_at->getTimestamp();
    }
}
