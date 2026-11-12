<?php

/*
 * The Religious Game (revival).
 * Based on "The Religious Game" by Enric Mogas Nonell, Jugando en .NET, 2004.
 * Licensed under the GNU Affero General Public License v3.0 or later. See LICENSE.
 */

declare(strict_types=1);

namespace App\Models\Content;

use Illuminate\Database\Eloquent\Relations\BelongsTo;

class TraitAgeFactor extends ContentRow
{
    protected $table = 'trait_age_factors';

    protected function casts(): array
    {
        return ['factor' => 'float'];
    }

    /** @return BelongsTo<MonkTrait, $this> */
    public function monkTrait(): BelongsTo
    {
        return $this->belongsTo(MonkTrait::class, 'trait_slug', 'slug');
    }
}
