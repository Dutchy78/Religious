<?php

/*
 * The Religious Game (revival).
 * Based on "The Religious Game" by Enric Mogas Nonell, Jugando en .NET, 2004.
 * Licensed under the GNU Affero General Public License v3.0 or later. See LICENSE.
 */

declare(strict_types=1);

namespace App\Models\Content;

use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

class ResourceType extends ContentModel
{
    protected $table = 'resource_types';

    protected function casts(): array
    {
        return ['is_assignable' => 'boolean', 'is_currency' => 'boolean', 'is_unique' => 'boolean', 'breeds' => 'boolean', 'is_original' => 'boolean', 'need_per_inhabitant' => 'float'];
    }

    /** @return BelongsTo<ResourceType, $this> */
    public function parent(): BelongsTo
    {
        return $this->belongsTo(ResourceType::class, 'parent_slug', 'slug');
    }

    /** @return HasMany<ResourceType, $this> */
    public function children(): HasMany
    {
        return $this->hasMany(ResourceType::class, 'parent_slug', 'slug');
    }

    /** @return BelongsTo<Unit, $this> */
    public function unit(): BelongsTo
    {
        return $this->belongsTo(Unit::class, 'unit_slug', 'slug');
    }
}
