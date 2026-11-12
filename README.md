# The Religious Game (revival)

A revival of **The Religious Game**, a monastery browser game by Enric Mogas
Nonell (Jugando en .NET, 2004–2005), rebuilt in PHP 8.3 and Laravel 13 from the
recovered database and CVS repository.

This is **Milestone 1: Foundations** from the design document:

- Laravel 13 with the official Livewire starter kit: sign-up, login, e-mail
  verification, password reset, two-factor authentication and passkeys.
- Docker setup: PHP 8.3, nginx, MariaDB 10.11, scheduler, queue worker, Mailpit.
- Content schema with English slugs (`library`, `plough`, `faith`); the
  original 3-letter codes are kept in `legacy_code`.
- Importer for the recovered `religious_db` dump, plus the revival's own design
  content: 4 orders, 5 regions with real climate data, 8 monastic hours and the
  night, ranks, offices, new buildings, goods, activities, events and name lists.
- Game clock: 1 game hour = 15 real minutes, rounds start on 1 January 1220,
  and a tick that processes every passed hour exactly once.
- Admin panel (Filament 5) at `/admin` to review and edit the imported content
  in English.

The game itself (monasteries, monks, schedules) starts in Milestone 2.

## Running it

You need [Docker Desktop](https://www.docker.com/products/docker-desktop/).

```bash
docker compose up --build
```

The first start installs the PHP and JavaScript packages, creates the
database, imports the game content and builds the front end. That takes a few
minutes; it is done when the log says **"The Religious Game is ready"**.

| What | Where |
| --- | --- |
| The game | http://localhost:8080 |
| Admin panel | http://localhost:8080/admin |
| E-mail (Mailpit) | http://localhost:8025 |
| Database (from your computer) | `127.0.0.1:3308`, user `religious`, password `religious` |

Ports can be changed with `APP_PORT`, `DB_PORT` and `MAILPIT_PORT` (for
example `APP_PORT=8090 docker compose up`). Port 3308 is used so it does not
clash with XAMPP (3306) or the recovery container (3307).

### First steps

1. Open http://localhost:8080 and register (**Found a monastery**).
2. Open Mailpit (http://localhost:8025) and click the verification link.
3. Make yourself an admin:

   ```bash
   docker compose exec app php artisan game:make-admin you@example.com
   ```

4. Open http://localhost:8080/admin and review the content.
5. Start the world clock:

   ```bash
   docker compose exec app php artisan game:new-world        # starts at the next aligned time
   docker compose exec app php artisan game:new-world --now  # or right away
   docker compose exec app php artisan game:clock            # show the game time
   ```

   The scheduler container runs `game:tick` every minute.

## Commands

| Command | What it does |
| --- | --- |
| `game:import-legacy [path] [--fresh] [--dry-run] [--if-empty]` | Loads the recovered content and the design content. `--fresh` replaces loaded content; hand-entered translations are kept. |
| `game:new-world [--now] [--speed=4] [--force]` | Starts a round on 1 January 1220. Without `--now` it waits for the next aligned start, so Matins begins at 06:00, 12:00, 18:00 and 00:00 Amsterdam time. |
| `game:tick [--max-hours=96]` | Processes every game hour that has passed (normally run by the scheduler). |
| `game:clock` | Shows round, game date, monastic hour, season and the next hour change. |
| `game:make-admin email` | Gives an account access to `/admin`. |

Run them as `docker compose exec app php artisan <command>`.

## Tests

```bash
docker compose exec app php artisan test
```

The project also has the starter kit's code-style and static-analysis checks:

```bash
docker compose exec app composer lint          # format with Pint
docker compose exec app composer types:check   # PHPStan / Larastan
```

## The recovered data

`database/legacy/religious_db.sql` is the copy from the project files. It lost
its accents on upload: 333 lines have the replacement character (Almacén
reads "Almac�n"). The importer accepts it, skips the 5 names that are damaged
and reports the rest. For the full text, replace the file with the original
dump from your computer (it is Latin-1; the importer detects that) and run:

```bash
docker compose exec app php artisan game:import-legacy --fresh
```

The original game's English, Spanish and Catalan texts are kept in the
`translations` table with source `legacy_2007`, as reference for translators.
English names were rewritten by hand where the 2007 text was machine
translated (in `app/Legacy/LegacyMap.php`).

## Where things are

| Path | Contents |
| --- | --- |
| `app/Legacy/` | Dump reader, code-to-slug map, legacy mapper (plain PHP, no framework) |
| `app/Content/` | Design content, the merged and checked content set, the database importer |
| `app/Game/Clock/` | Game calendar and real-time conversion |
| `app/Game/Tick/` | Tick plan and runner; `GameHourProcessed` event for Milestone 2 |
| `app/Models/Content/` | Eloquent models for the content tables |
| `app/Filament/Resources/` | Admin screens |
| `database/migrations/2026_11_12_*` | Content tables, world clock, user language and admin flag |
| `docker/`, `docker-compose.yml` | Development environment |
| `tests/Unit/Game`, `tests/Unit/Legacy`, `tests/Feature/Game` | Tests for this milestone |

## Notes

- `composer.lock` is not included yet: the first `composer install` creates it.
  Commit it so everyone gets the same package versions.
- Real times follow `GAME_TIMEZONE` (Europe/Amsterdam). The clock itself runs
  on UTC, so when summer time starts or ends the monastic hours shift by one
  real hour against the wall clock.
- The site is English for everyone. A player's `preferred_locale` is used only
  once another language is switched on (`languages.is_active`).

## Licence and credits

Based on *The Religious Game* by Enric Mogas Nonell, Jugando en .NET, 2004,
released under the GNU GPL v2 or later. This revival is released under the
**GNU Affero General Public License v3.0 or later** (see `LICENSE`): anyone
who runs a modified version publicly must offer its source code to its
players. Set `GAME_SOURCE_URL` to your repository so the footer links to it.

The Laravel starter kit is MIT licensed.
