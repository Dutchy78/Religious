<?php

/*
 * The Religious Game (revival).
 * Based on "The Religious Game" by Enric Mogas Nonell, Jugando en .NET, 2004.
 * Licensed under the GNU Affero General Public License v3.0 or later. See LICENSE.
 */

declare(strict_types=1);

namespace App\Models\Content;

use Illuminate\Database\Eloquent\Relations\HasMany;

class MonkTrait extends ContentModel
{
    protected $table = 'traits';

    protected function casts(): array
    {
        return ['is_inverse' => 'boolean'];
    }

    /** @return HasMany<TraitAgeFactor, $this> */
    public function ageFactors(): HasMany
    {
        return $this->hasMany(TraitAgeFactor::class, 'trait_slug', 'slug');
    }
}
