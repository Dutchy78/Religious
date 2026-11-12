<?php

/*
 * The Religious Game (revival).
 * Based on "The Religious Game" by Enric Mogas Nonell, Jugando en .NET, 2004.
 * Licensed under the GNU Affero General Public License v3.0 or later. See LICENSE.
 */

declare(strict_types=1);

namespace App\Models\Content;

use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Office extends ContentModel
{
    protected $table = 'offices';

    /** @return BelongsTo<BuildingType, $this> */
    public function requiredBuilding(): BelongsTo
    {
        return $this->belongsTo(BuildingType::class, 'required_building_slug', 'slug');
    }
}
