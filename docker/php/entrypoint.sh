#!/usr/bin/env bash
# Prepares the app on first start, then runs the container's command.
# Only the "app" container (ROLE=app) installs and migrates; the scheduler
# and queue containers wait until it is ready.
set -euo pipefail
cd /var/www/html

READY=storage/framework/.docker-ready

if [ "${ROLE:-app}" = "app" ]; then
    rm -f "$READY"

    [ -f .env ] || cp .env.docker .env

    if [ ! -f vendor/autoload.php ]; then
        echo "Installing PHP packages (first start, takes a few minutes)..."
        composer install --no-interaction --prefer-dist
    fi

    grep -q '^APP_KEY=base64:' .env || php artisan key:generate --force

    echo "Waiting for the database..."
    until php artisan db:show >/dev/null 2>&1; do sleep 2; done

    php artisan migrate --force

    php artisan game:import-legacy --if-empty

    if [ ! -f public/build/manifest.json ]; then
        echo "Building front-end assets..."
        npm install --no-audit --no-fund
        npm run build
    fi

    php artisan filament:assets >/dev/null
    php artisan storage:link >/dev/null 2>&1 || true

    touch "$READY"
    echo "The Religious Game is ready at http://localhost:${APP_PORT:-8080}"
else
    echo "Waiting for the app container to finish setting up..."
    until [ -f "$READY" ]; do sleep 3; done
fi

exec "$@"
