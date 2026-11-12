<?php

use Illuminate\Support\Facades\Schedule;

// The world clock: a game hour passes every 15 real minutes. Running every
// minute keeps the game no more than a minute behind real time.
Schedule::command('game:tick')
    ->everyMinute()
    ->withoutOverlapping()
    ->runInBackground();
