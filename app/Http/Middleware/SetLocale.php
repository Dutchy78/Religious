<?php

/*
 * The Religious Game (revival).
 * Based on "The Religious Game" by Enric Mogas Nonell, Jugando en .NET, 2004.
 * Licensed under the GNU Affero General Public License v3.0 or later. See LICENSE.
 */

declare(strict_types=1);

namespace App\Http\Middleware;

use App\Models\Content\Language;
use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\App;
use Symfony\Component\HttpFoundation\Response;
use Throwable;

/**
 * The site is English for everyone by default (no browser detection). A
 * logged-in player who chose another language gets it, if that language has
 * been switched on.
 */
class SetLocale
{
    public function handle(Request $request, Closure $next): Response
    {
        $locale = $request->user()?->preferred_locale;

        if (is_string($locale) && $locale !== 'en' && $this->isActive($locale)) {
            App::setLocale($locale);
        }

        return $next($request);
    }

    private function isActive(string $locale): bool
    {
        try {
            return Language::query()->whereKey($locale)->where('is_active', true)->exists();
        } catch (Throwable) {
            return false; // content not imported yet
        }
    }
}
