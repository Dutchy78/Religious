<?php

/*
 * The Religious Game (revival).
 * Based on "The Religious Game" by Enric Mogas Nonell, Jugando en .NET, 2004.
 * Licensed under the GNU Affero General Public License v3.0 or later. See LICENSE.
 */

declare(strict_types=1);

namespace App\Models\Content;

use Illuminate\Database\Eloquent\Relations\BelongsTo;

class ActivityStep extends ContentRow
{
    protected $table = 'activity_steps';

    protected function casts(): array
    {
        return ['parameter1' => 'float', 'parameter2' => 'float', 'is_global_message' => 'boolean'];
    }

    /** @return BelongsTo<Activity, $this> */
    public function activity(): BelongsTo
    {
        return $this->belongsTo(Activity::class, 'activity_slug', 'slug');
    }
}
