<?php

/*
 * The Religious Game (revival).
 * Based on "The Religious Game" by Enric Mogas Nonell, Jugando en .NET, 2004.
 * Licensed under the GNU Affero General Public License v3.0 or later. See LICENSE.
 */

declare(strict_types=1);

namespace App\Models\Content;

use Illuminate\Database\Eloquent\Relations\HasMany;

class Region extends ContentModel
{
    protected $table = 'regions';

    protected function casts(): array
    {
        return ['has_coast' => 'boolean', 'is_original' => 'boolean'];
    }

    /** @return HasMany<RegionClimate, $this> */
    public function climates(): HasMany
    {
        return $this->hasMany(RegionClimate::class, 'region_slug', 'slug');
    }
}
