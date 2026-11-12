<?php

/*
 * The Religious Game (revival).
 * Based on "The Religious Game" by Enric Mogas Nonell, Jugando en .NET, 2004.
 * Licensed under the GNU Affero General Public License v3.0 or later. See LICENSE.
 */

declare(strict_types=1);

namespace App\Models\Content;

use Illuminate\Database\Eloquent\Relations\BelongsTo;

class RegionClimate extends ContentRow
{
    protected $table = 'region_climates';

    protected function casts(): array
    {
        return ['mean_temperature' => 'float'];
    }

    /** @return BelongsTo<Region, $this> */
    public function region(): BelongsTo
    {
        return $this->belongsTo(Region::class, 'region_slug', 'slug');
    }
}
