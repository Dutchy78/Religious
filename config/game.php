<?php

return [

    /*
    | Time zone used to line up the monastic hours with real clock times
    | (Matins at 06:00, 12:00, 18:00 and 00:00) and to show real times.
    */
    'timezone' => env('GAME_TIMEZONE', 'Europe/Amsterdam'),

    /*
    | The AGPL asks that players of a public server can get its source code.
    | Point this at the repository of the version you run.
    */
    'source_url' => env('GAME_SOURCE_URL', 'https://example.org/religious-game'),

];
