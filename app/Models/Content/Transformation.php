<?php

/*
 * The Religious Game (revival).
 * Based on "The Religious Game" by Enric Mogas Nonell, Jugando en .NET, 2004.
 * Licensed under the GNU Affero General Public License v3.0 or later. See LICENSE.
 */

declare(strict_types=1);

namespace App\Models\Content;

class Transformation extends ContentRow
{
    protected $table = 'transformations';

    protected function casts(): array
    {
        return ['quantity' => 'float', 'replaces' => 'boolean'];
    }
}
