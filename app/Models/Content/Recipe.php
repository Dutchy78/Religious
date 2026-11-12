<?php

/*
 * The Religious Game (revival).
 * Based on "The Religious Game" by Enric Mogas Nonell, Jugando en .NET, 2004.
 * Licensed under the GNU Affero General Public License v3.0 or later. See LICENSE.
 */

declare(strict_types=1);

namespace App\Models\Content;

use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Recipe extends ContentRow
{
    protected $table = 'recipes';

    protected function casts(): array
    {
        return ['need_minimum' => 'float', 'need_maximum' => 'float'];
    }

    /** @return BelongsTo<ResourceType, $this> */
    public function output(): BelongsTo
    {
        return $this->belongsTo(ResourceType::class, 'output_resource_slug', 'slug');
    }

    /** @return BelongsTo<ResourceType, $this> */
    public function input(): BelongsTo
    {
        return $this->belongsTo(ResourceType::class, 'input_resource_slug', 'slug');
    }

    /** @return BelongsTo<Activity, $this> */
    public function activity(): BelongsTo
    {
        return $this->belongsTo(Activity::class, 'activity_slug', 'slug');
    }
}
