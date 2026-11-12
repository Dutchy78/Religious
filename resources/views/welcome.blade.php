<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>{{ config('app.name', 'The Religious Game') }}</title>
        <link rel="icon" href="/favicon.ico" sizes="any">
        <style>
            /* "Illuminated ledger" colours from the design document */
            :root {
                --vellum: #f3ead6; --card: #fbf6ea; --rule: #d8c9a8; --ink: #2a2018; --ink-2: #5b4c3d; --ink-3: #8a7a66;
                --rubric: #8c1d18; --gold: #a8812f; --gold-2: #d9b867;
            }
            * { box-sizing: border-box; margin: 0; padding: 0; }
            body {
                min-height: 100vh; display: flex; flex-direction: column; background: var(--vellum); color: var(--ink);
                font-family: "EB Garamond", Georgia, "Times New Roman", serif; font-size: 18px;
            }
            header { background: var(--ink); color: var(--vellum); border-bottom: 3px solid var(--gold); padding: 18px 24px; display: flex; justify-content: space-between; align-items: center; gap: 16px; flex-wrap: wrap; }
            header .brand { font-variant: small-caps; letter-spacing: .08em; font-size: 22px; font-weight: 700; }
            header nav { display: flex; gap: 12px; }
            header a { color: var(--gold-2); text-decoration: none; font-family: system-ui, sans-serif; font-size: 14px; padding: 8px 14px; border: 1px solid #5a4b3c; border-radius: 4px; }
            header a.primary { background: var(--gold); color: var(--ink); border-color: var(--gold); font-weight: 600; }
            main { flex: 1; max-width: 760px; margin: 0 auto; padding: 56px 24px; }
            h1 { font-size: 40px; line-height: 1.15; margin-bottom: 16px; letter-spacing: .02em; }
            h1 .cap { color: var(--rubric); font-size: 54px; }
            p { line-height: 1.6; color: var(--ink-2); margin-bottom: 16px; }
            .card { background: var(--card); border: 1px solid var(--rule); border-radius: 6px; padding: 20px 24px; margin-top: 28px; }
            .card h2 { font-variant: small-caps; letter-spacing: .1em; font-size: 16px; color: var(--ink-2); margin-bottom: 8px; }
            footer { border-top: 1px solid var(--rule); padding: 16px 24px; font-style: italic; color: var(--ink-3); font-size: 15px; display: flex; justify-content: space-between; gap: 12px; flex-wrap: wrap; }
            footer a { color: var(--ink-3); }
        </style>
    </head>
    <body>
        <header>
            <div class="brand">{{ config('app.name', 'The Religious Game') }}</div>
            @if (Route::has('login'))
                <nav>
                    @auth
                        <a class="primary" href="{{ route('dashboard') }}">{{ __('Enter your monastery') }}</a>
                    @else
                        <a href="{{ route('login') }}">{{ __('Log in') }}</a>
                        @if (Route::has('register'))
                            <a class="primary" href="{{ route('register') }}">{{ __('Found a monastery') }}</a>
                        @endif
                    @endauth
                </nav>
            @endif
        </header>

        <main>
            <h1><span class="cap">A</span>nno Domini 1220</h1>
            <p>{{ __('Lead a monastery in medieval Navarre, Castile, Aragon, Catalonia or Galicia. Plan the hours of prayer and work, bring in the harvest, keep your community fed and faithful, and trade at the market with the houses around you.') }}</p>
            <p>{{ __('Each round lasts one year of game time, about three months of real time.') }}</p>

            <div class="card">
                <h2>{{ __('Being restored') }}</h2>
                <p>{{ __('This is a revival of a browser game from 2004–2005. The world is being rebuilt; your monastery will follow soon.') }}</p>
            </div>
        </main>

        <footer>
            <span>{{ __('Based on The Religious Game by Enric Mogas Nonell, Jugando en .NET, 2004.') }}</span>
            <span>{{ __('Free software under the GNU AGPL v3.') }} <a href="{{ config('game.source_url') }}">{{ __('Source code') }}</a></span>
        </footer>
    </body>
</html>
