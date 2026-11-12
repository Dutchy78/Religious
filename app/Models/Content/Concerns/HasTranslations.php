<?php

/*
 * The Religious Game (revival).
 * Based on "The Religious Game" by Enric Mogas Nonell, Jugando en .NET, 2004.
 * Licensed under the GNU Affero General Public License v3.0 or later. See LICENSE.
 */

declare(strict_types=1);

namespace App\Models\Content\Concerns;

use App\Models\Content\Translation;
use Illuminate\Support\Facades\App;

/**
 * English is the source language and lives on the model itself. Other
 * languages come from the translations table and fall back to English.
 */
trait HasTranslations
{
    public function translated(string $field, ?string $locale = null): mixed
    {
        $locale ??= App::getLocale();

        if ($locale === 'en') {
            return $this->getAttribute($field);
        }

        $value = Translation::query()
            ->where('translatable_type', $this->getTable())
            ->where('translatable_key', (string) $this->getKey())
            ->where('locale', $locale)
            ->where('field', $field)
            ->where('source', Translation::SOURCE_MANUAL)
            ->value('value');

        return $value ?? $this->getAttribute($field);
    }
}
