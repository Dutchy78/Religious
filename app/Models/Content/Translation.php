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
 * A text in another language than English, for any content row (or a UI
 * string). Rows with source "legacy_2007" are the original game's texts,
 * kept as reference for translators; only "manual" rows are shown to players.
 */
class Translation extends Model
{
    public const SOURCE_LEGACY = 'legacy_2007';

    public const SOURCE_MANUAL = 'manual';

    protected $guarded = [];
}
