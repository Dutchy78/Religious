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

class Activity extends ContentModel
{
    protected $table = 'activities';

    protected function casts(): array
    {
        return ['is_original' => 'boolean'];
    }

    /** @return BelongsTo<Activity, $this> */
    public function parent(): BelongsTo
    {
        return $this->belongsTo(Activity::class, 'parent_slug', 'slug');
    }

    /** @return HasMany<ActivityStep, $this> */
    public function steps(): HasMany
    {
        return $this->hasMany(ActivityStep::class, 'activity_slug', 'slug');
    }
}
