<?php

/*
 * The Religious Game (revival).
 * Based on "The Religious Game" by Enric Mogas Nonell, Jugando en .NET, 2004.
 * Licensed under the GNU Affero General Public License v3.0 or later. See LICENSE.
 */

declare(strict_types=1);

namespace App\Models\Content;

use Illuminate\Database\Eloquent\Model;

/**
 * Base for content rows with a numeric id and no timestamps.
 */
abstract class ContentRow extends Model
{
    public $timestamps = false;

    protected $guarded = [];
}
