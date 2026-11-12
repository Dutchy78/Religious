# Handoff: The Religious Game revival

Read this first when starting a new session on this repository
(`Dutchy78/Religious`). It sums up where the work stands, what was decided and
what to do next. Last updated: 12 November 2026.

## 1. What this project is

A revival of **The Religious Game**, a Spanish monastery browser game written
by Enric Mogas Nonell for Jugando en .NET (2004–2005). The original PHP 4 code
(CVS repository) and a MySQL 5.0 database were recovered from an old hard
drive. The game is being rebuilt from scratch in **PHP 8.3 / Laravel 13**,
using the old code only as a specification and the old database as content.

- **Design document** (all decisions, the source of truth):
  https://claude.ai/code/artifact/6e47a6f5-b7b5-4954-be24-148f4b959914
  ("The Religious Game — PHP 8 Revival Design").
- **claude.ai Project "Old Websites"** holds supporting files:
  - `religious_db.sql`: the recovered dump. Its accents were damaged on upload
    (333 lines contain U+FFFD). The owner has the original Latin-1 dump locally.
  - `claude/religious-game/monastery-page-mockup.html`: the approved
    "Illuminated ledger" page design (HTML/CSS; fonts EB Garamond, Cinzel, Inter).
  - `claude/religious-game/name-filter-test-names.txt`: 1,976 joke names, test
    input only for the name filter (must mostly be rejected).
- The original CVS repository (zip) was uploaded in the first session; it is
  not in this repo. Ask the owner to attach it again if the old code is needed.

## 2. Repository state

| Ref | Contents |
| --- | --- |
| `main` @ `961086a` | Milestone 1 merged (PR #1, commit `586b482`) |
| CI fix (not yet pushed) | One commit, "Fix CI: code style (Pint) and static analysis types" |

**First task in a new session:** the CI checks on PR #1 failed. The fix exists
as a commit in `religious-ci-fix.bundle` (the owner has it; it may also be
pushed already as branch `ci-fix`). If it is not on GitHub yet:

```bash
git checkout main && git pull
git fetch /path/to/religious-ci-fix.bundle milestone-1:ci-fix
git push -u origin ci-fix   # then open a PR into main
```

If the bundle is not available, redo the fix: run `vendor/bin/pint`, then
`composer types:check` and fix what PHPStan (Larastan, level 7) reports.
What the fix already contained:

- Pint formatting on 21 files.
- `LegacyMap::REGIONS` and `TRAIT_APPLIES_TO` PHPDoc keys are `int` (PHP turns
  numeric string keys into ints).
- `DesignContent::resourceTypes()` wrapped in `array_values()`.
- Commands validate `argument()` / `option()` values before use.
- `AdminPanelProvider` uses `PreventRequestForgery` directly (`VerifyCsrfToken`
  is a deprecated alias in Laravel 13).

**Not yet verified anywhere:** Larastan on the Laravel-side files (models,
commands, Filament resources) and the Laravel feature tests. The first session
had no Packagist access and no Docker, so only the framework-independent code
was run (28 unit tests, a SQLite load test of all content with foreign keys on,
PHPStan level 7 on `app/Legacy`, `app/Content`, `app/Game/Clock`, `TickPlan`).

## 3. How to run

```bash
docker compose up --build        # first start installs, migrates, imports, builds
docker compose exec app php artisan test
docker compose exec app composer ci:check   # what GitHub Actions runs
```

Game at http://localhost:8080, admin at `/admin`, Mailpit at
http://localhost:8025, MariaDB on host port 3308. Full steps in `README.md`.
CI: `.github/workflows/tests.yml` runs `composer setup` then `composer ci:check`
(Pint test, PHPStan, `php artisan test`) on PHP 8.3 with SQLite.

## 4. What Milestone 1 contains

| Area | Where |
| --- | --- |
| Dump reader (no MySQL needed, detects UTF-8 vs Windows-1252) | `app/Legacy/SqlDumpReader.php` |
| Old 3-letter codes → English slugs and hand-cleaned English names | `app/Legacy/LegacyMap.php` |
| Legacy tables → new content rows; old es/ca/en texts → `translations` (source `legacy_2007`) | `app/Legacy/LegacyContentMapper.php` |
| Revival content from the design doc (orders, regions + climate, periods, ranks, offices, new buildings/goods/activities/events, parcel types, name lists) | `app/Content/DesignContent.php` |
| Merge, load order (parents first), reference check | `app/Content/ContentSet.php` |
| Database writer (one transaction; keeps `manual` translations) | `app/Content/ContentImporter.php` |
| Calendar (365 days, 1 Jan 1220 = Wednesday, 8 monastic hours + night) | `app/Game/Clock/GameTime.php` |
| Real time ↔ game time (4 game hours per real hour, aligned starts) | `app/Game/Clock/WorldClockMath.php` |
| Tick (lock, one transaction per game hour, `GameHourProcessed` event) | `app/Game/Tick/` |
| Commands | `game:import-legacy`, `game:new-world`, `game:tick`, `game:clock`, `game:make-admin` |
| Admin (Filament 5, 15 screens, edit English text, no create/delete except names) | `app/Filament/Resources/`, `app/Providers/Filament/AdminPanelProvider.php` |
| Schema | `database/migrations/2026_11_12_*` (26 content tables, `world_clocks`, `users.preferred_locale`, `users.is_admin`) |

Content counts after import: 28 building types, 132 goods, 38 activities,
17 traits, 4 orders, 5 regions, 60 climate rows, 9 periods, 11 offices,
121 activity rule steps, ~3,630 names, ~2,078 reference translations.

Known importer notes (expected warnings): building code `or`, resource code
`cul`, feature `tra`, trait `ara` and one empty transformation are unmapped in
the original data and skipped; `vin` (wine) maps to the new `wine` resource;
5 accent-damaged first names are skipped until the original dump is used.

## 5. Decisions that shape all further work

Everything below is in the design document; this is the short version.

- **Stack:** PHP 8.3+, Laravel 13, Livewire 4 starter kit (Fortify auth),
  Filament 5 admin, MariaDB 10.11, Docker. Chosen for ease of maintenance.
- **Licence:** GNU AGPL v3 or later. Every source file carries the credit header
  to Enric Mogas Nonell / Jugando en .NET; credits page and source link in the footer.
- **Language:** English first, everywhere (code, content, UI). Strings through
  `__()`. Spanish and Catalan come after the design is formalised. Site is
  English by default; logged-in users may pick an active language.
- **Time:** 8 monastic hours of 30 real minutes (2 game hours each) plus a fixed
  night of 2 real hours (8 game hours). 1 game day = 6 real hours, 4 game days
  per real day, 1 game year ≈ 91 real days = one round. Rounds start
  1 January 1220 and reset back to 1220. Matins at 06:00, 12:00, 18:00, 00:00
  Europe/Amsterdam; nights 04–06, 10–12, 16–18, 22–24. The night is the
  server's batch and maintenance window; sleep is never scheduled.
- **Crops** grow in 5 game days (30 real hours); yields per harvest about a third
  of the original.
- **Orders:** Carthusians, Dominicans, Benedictines, Cistercians, each with a
  strength and weakness. **Regions:** Navarra, Castilla y León, Catalunya,
  Aragón, Galicia, with real monthly climate normals.
- **Monasteries and convents:** same rules; convents need a chaplain for Mass
  (a monastery's Prior can be assigned, or a hired priest), nuns stay enclosed
  (hired carters), +15% faith from prayer.
- **Ranks and offices:** novice → professed monk/nun, plus 11 offices (Abbot,
  Prior, Master of Novices, Cellarer, Chamberlain, Sacrist, Cantor,
  Infirmarian, Guest Master, Kitchener, Porter). Abbot elected on death.
  Abbot Primate is a seasonal regional title.
- **Names:** birth name by region + surname; religious name chosen at
  profession; foreign (English/French) candidates; name filter with test sets.
- **Economy:** market stalls (instant buy, 10 listings), regional merchant with
  fixed prices and scarcity per region, weekly market day, auctions settled at
  night, trade expeditions later (needs Stable, draught animal, harness).
- **Scoring:** mix of Spirit, Prosperity, Community, Works (0–100 each, averaged).
- **Players:** 1 monastery per account, up to 3 accounts per e-mail (no trading
  between them), vacation mode freezes the monastery, new players start in a
  tutorial and join the live world at the next round.
- **Estate:** each monastery owns land parcels (field, orchard, vineyard,
  pasture, forest, water, hillside); no shared map.
- **Look:** "Illuminated ledger" (parchment, ink, rubric red `#8c1d18`, gold
  `#a8812f`), see the mockup in the Project.

## 6. Next steps

1. Get the CI fix onto GitHub and make `composer ci:check` pass (section 2).
2. Run the Docker setup once end to end; import the original Latin-1 dump with
   `php artisan game:import-legacy --fresh` to restore accents.
3. Commit the `composer.lock` created by the first install.
4. **Milestone 2: one monastery.** Monks, schedules, buildings, the rule-step
   engine (listeners on `GameHourProcessed`), food and upkeep, fields, spoilage,
   deaths, the starting position, and the Monastery page built from the mockup.
   Done when a monastery survives a game year with sensible choices and starves
   without them.

## 7. Working conventions so far

- Decisions are recorded in the design document as they are made.
- Work has gone to `Dutchy78/Religious` through a branch and pull request
  (PR #1 for Milestone 1).
