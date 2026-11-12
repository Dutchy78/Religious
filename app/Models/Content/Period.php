<?php

/*
 * The Religious Game (revival).
 * Based on "The Religious Game" by Enric Mogas Nonell, Jugando en .NET, 2004.
 * Licensed under the GNU Affero General Public License v3.0 or later. See LICENSE.
 */

declare(strict_types=1);

namespace App\Models\Content;

class Period extends ContentModel
{
    protected $table = 'periods';

    protected function casts(): array
    {
        return ['is_schedulable' => 'boolean'];
    }
}
