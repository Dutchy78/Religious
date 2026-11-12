<?php

/*
 * The Religious Game (revival).
 * Based on "The Religious Game" by Enric Mogas Nonell, Jugando en .NET, 2004.
 * Licensed under the GNU Affero General Public License v3.0 or later. See LICENSE.
 */

namespace Tests\Feature\Game;

use App\Models\Content\BuildingType;
use App\Models\Content\ResourceType;
use App\Models\Content\Translation;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Support\Facades\DB;
use Tests\TestCase;

class ImportLegacyCommandTest extends TestCase
{
    use RefreshDatabase;

    public function test_it_imports_the_recovered_content(): void
    {
        $this->artisan('game:import-legacy')->assertSuccessful();

        $this->assertSame(28, BuildingType::query()->count());
        $this->assertSame(132, ResourceType::query()->count());
        $this->assertSame('Library', BuildingType::query()->findOrFail('library')->name);
        $this->assertSame(90, BuildingType::query()->findOrFail('walls')->build_days);
        $this->assertSame('cereals', ResourceType::query()->findOrFail('wheat')->parent?->slug);
        $this->assertSame(4, BuildingType::query()->findOrFail('library')->costs()->count());
        $this->assertSame(60, DB::table('region_climates')->count());
        $this->assertGreaterThan(3500, DB::table('names')->count());
    }

    public function test_a_second_import_needs_fresh_and_keeps_manual_translations(): void
    {
        $this->artisan('game:import-legacy')->assertSuccessful();

        Translation::query()->create([
            'translatable_type' => 'building_types',
            'translatable_key' => 'library',
            'locale' => 'es',
            'field' => 'name',
            'value' => 'Biblioteca',
            'source' => Translation::SOURCE_MANUAL,
        ]);

        $this->artisan('game:import-legacy')->assertFailed();
        $this->artisan('game:import-legacy', ['--fresh' => true])->assertSuccessful();

        $this->assertSame(28, BuildingType::query()->count());
        $this->assertTrue(Translation::query()->where('source', Translation::SOURCE_MANUAL)->exists());
        $this->assertSame('Biblioteca', BuildingType::query()->findOrFail('library')->translated('name', 'es'));
        $this->assertSame('Library', BuildingType::query()->findOrFail('library')->translated('name', 'en'));
    }

    public function test_if_empty_only_imports_once(): void
    {
        $this->artisan('game:import-legacy', ['--if-empty' => true])->assertSuccessful();
        $this->assertSame(28, BuildingType::query()->count());

        BuildingType::query()->findOrFail('library')->update(['name' => 'Scriptorium library']);

        $this->artisan('game:import-legacy', ['--if-empty' => true])
            ->expectsOutputToContain('already loaded')
            ->assertSuccessful();
        $this->assertSame('Scriptorium library', BuildingType::query()->findOrFail('library')->name);
    }

    public function test_dry_run_writes_nothing(): void
    {
        $this->artisan('game:import-legacy', ['--dry-run' => true])->assertSuccessful();

        $this->assertSame(0, BuildingType::query()->count());
    }

    public function test_a_missing_dump_fails_cleanly(): void
    {
        $this->artisan('game:import-legacy', ['path' => '/nowhere/religious_db.sql'])->assertFailed();
    }
}
