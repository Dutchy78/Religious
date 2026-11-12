<?php

/*
 * The Religious Game (revival).
 * Based on "The Religious Game" by Enric Mogas Nonell, Jugando en .NET, 2004.
 * Licensed under the GNU Affero General Public License v3.0 or later. See LICENSE.
 */

declare(strict_types=1);

namespace App\Models\Content;

use Illuminate\Database\Eloquent\Relations\HasMany;

class BuildingType extends ContentModel
{
    protected $table = 'building_types';

    protected function casts(): array
    {
        return ['is_original' => 'boolean'];
    }

    /** @return HasMany<BuildingCost, $this> */
    public function costs(): HasMany
    {
        return $this->hasMany(BuildingCost::class, 'building_type_slug', 'slug');
    }

    /** @return HasMany<BuildingFeature, $this> */
    public function features(): HasMany
    {
        return $this->hasMany(BuildingFeature::class, 'building_type_slug', 'slug');
    }
}
