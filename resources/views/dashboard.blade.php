@php
    $clock = \App\Models\WorldClock::current();
    $now = $clock?->now();
@endphp

<x-layouts::app :title="__('Dashboard')">
    <div class="flex h-full w-full flex-1 flex-col gap-4">
        <div class="rounded-xl border border-neutral-200 p-6 dark:border-neutral-700">
            <h2 class="mb-2 text-sm font-semibold uppercase tracking-widest text-neutral-500">{{ __('The world') }}</h2>

            @if ($now === null)
                <p class="text-lg">{{ __('No world has been started yet.') }}</p>
            @elseif (! $clock->hasStarted())
                <p class="text-lg">{{ __('Round :round begins on 1 January 1220.', ['round' => $clock->round_number]) }}</p>
                <p class="text-neutral-500">
                    {{ __('Opening at :time.', ['time' => $clock->epoch_at->setTimezone(config('game.timezone'))->format('j F Y, H:i')]) }}
                </p>
            @else
                <p class="text-2xl">
                    {{ __('Anno Domini :year', ['year' => $now->year()]) }} · {{ $now->day() }} {{ __($now->monthName()) }}
                </p>
                <p class="text-neutral-500">
                    {{ __($now->weekdayName()) }} · {{ __(ucfirst($now->season())) }} ·
                    @if ($now->isNight())
                        {{ __('Night: the community sleeps') }}
                    @else
                        {{ __(ucfirst($now->period())) }}
                    @endif
                </p>
            @endif
        </div>

        <div class="rounded-xl border border-neutral-200 p-6 text-neutral-500 dark:border-neutral-700">
            {{ __('Your monastery arrives in the next milestone. Until then the world clock runs and the game content can be reviewed in the admin panel.') }}
        </div>
    </div>
</x-layouts::app>
