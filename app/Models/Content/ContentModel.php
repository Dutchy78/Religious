<?php

/*
 * The Religious Game (revival).
 * Based on "The Religious Game" by Enric Mogas Nonell, Jugando en .NET, 2004.
 * Licensed under the GNU Affero General Public License v3.0 or later. See LICENSE.
 */

declare(strict_types=1);

namespace App\Models\Content;

use App\Models\Content\Concerns\HasTranslations;
use Illuminate\Database\Eloquent\Model;

/**
 * Base for content models keyed by an English slug.
 */
abstract class ContentModel extends Model
{
    use HasTranslations;

    protected $primaryKey = 'slug';

    public $incrementing = false;

    protected $keyType = 'string';

    protected $guarded = [];
}
