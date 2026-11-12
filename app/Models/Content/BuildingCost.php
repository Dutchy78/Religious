<?php

/*
 * The Religious Game (revival).
 * Based on "The Religious Game" by Enric Mogas Nonell, Jugando en .NET, 2004.
 * Licensed under the GNU Affero General Public License v3.0 or later. See LICENSE.
 */

declare(strict_types=1);

namespace App\Models\Content;

use Illuminate\Database\Eloquent\Relations\BelongsTo;

class BuildingCost extends ContentRow
{
    protected $table = 'building_costs';

    protected function casts(): array
    {
        return ['quantity' => 'float'];
    }

    /** @return BelongsTo<BuildingType, $this> */
    public function buildingType(): BelongsTo
    {
        return $this->belongsTo(BuildingType::class, 'building_type_slug', 'slug');
    }

    /** @return BelongsTo<ResourceType, $this> */
    public function resourceType(): BelongsTo
    {
        return $this->belongsTo(ResourceType::class, 'resource_slug', 'slug');
    }
}
