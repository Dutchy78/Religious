<?php

/*
 * The Religious Game (revival).
 * Based on "The Religious Game" by Enric Mogas Nonell, Jugando en .NET, 2004.
 * Licensed under the GNU Affero General Public License v3.0 or later. See LICENSE.
 */

declare(strict_types=1);

namespace App\Models\Content;

use Illuminate\Database\Eloquent\Relations\HasMany;

class EventType extends ContentModel
{
    protected $table = 'event_types';

    protected function casts(): array
    {
        return ['is_original' => 'boolean'];
    }

    /** @return HasMany<EventChoice, $this> */
    public function choices(): HasMany
    {
        return $this->hasMany(EventChoice::class, 'event_type_slug', 'slug');
    }
}
