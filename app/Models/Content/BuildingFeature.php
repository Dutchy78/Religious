<?php

/*
 * The Religious Game (revival).
 * Based on "The Religious Game" by Enric Mogas Nonell, Jugando en .NET, 2004.
 * Licensed under the GNU Affero General Public License v3.0 or later. See LICENSE.
 */

declare(strict_types=1);

namespace App\Models\Content;

use Illuminate\Database\Eloquent\Relations\BelongsTo;

class BuildingFeature extends ContentRow
{
    protected $table = 'building_features';

    protected function casts(): array
    {
        return ['amount' => 'float'];
    }

    /** @return BelongsTo<BuildingType, $this> */
    public function buildingType(): BelongsTo
    {
        return $this->belongsTo(BuildingType::class, 'building_type_slug', 'slug');
    }

    /** @return BelongsTo<Activity, $this> */
    public function activity(): BelongsTo
    {
        return $this->belongsTo(Activity::class, 'activity_slug', 'slug');
    }

    /** @return BelongsTo<ResourceType, $this> */
    public function resourceType(): BelongsTo
    {
        return $this->belongsTo(ResourceType::class, 'resource_slug', 'slug');
    }

    /** @return BelongsTo<MonkTrait, $this> */
    public function monkTrait(): BelongsTo
    {
        return $this->belongsTo(MonkTrait::class, 'trait_slug', 'slug');
    }

    /** @return BelongsTo<FieldState, $this> */
    public function fieldState(): BelongsTo
    {
        return $this->belongsTo(FieldState::class, 'field_state_slug', 'slug');
    }
}
