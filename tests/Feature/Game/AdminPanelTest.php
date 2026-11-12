<?php

/*
 * The Religious Game (revival).
 * Based on "The Religious Game" by Enric Mogas Nonell, Jugando en .NET, 2004.
 * Licensed under the GNU Affero General Public License v3.0 or later. See LICENSE.
 */

namespace Tests\Feature\Game;

use App\Models\User;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;

class AdminPanelTest extends TestCase
{
    use RefreshDatabase;

    public function test_guests_are_sent_to_the_admin_login(): void
    {
        $this->get('/admin')->assertRedirect('/admin/login');
    }

    public function test_players_cannot_open_the_admin_panel(): void
    {
        $this->actingAs(User::factory()->create());

        $this->get('/admin')->assertForbidden();
    }

    public function test_make_admin_command_grants_access(): void
    {
        $user = User::factory()->create(['email' => 'abbot@example.com']);

        $this->artisan('game:make-admin', ['email' => 'abbot@example.com'])->assertSuccessful();
        $this->artisan('game:make-admin', ['email' => 'nobody@example.com'])->assertFailed();

        $this->assertTrue($user->fresh()->is_admin);
    }

    public function test_admins_see_the_imported_content_in_english(): void
    {
        $this->artisan('game:import-legacy')->assertSuccessful();

        $admin = User::factory()->create();
        $admin->forceFill(['is_admin' => true])->save();
        $this->actingAs($admin);

        $this->get('/admin')->assertOk();
        $this->get('/admin/building-types')->assertOk()->assertSee('Library')->assertSee('Sewing room');
        $this->get('/admin/resource-types')->assertOk()->assertSee('Wheat');
        $this->get('/admin/activities')->assertOk()->assertSee('Celebrate Mass');
        $this->get('/admin/regions')->assertOk()->assertSee('Galicia');
        $this->get('/admin/monk-traits')->assertOk()->assertSee('Faith');
        $this->get('/admin/names')->assertOk();
        $this->get('/admin/translations')->assertOk();
    }

    public function test_players_keep_english_unless_they_chose_an_active_language(): void
    {
        $this->artisan('game:import-legacy')->assertSuccessful();

        $player = User::factory()->create();
        $player->forceFill(['preferred_locale' => 'es'])->save();
        $this->actingAs($player);

        // Spanish is not switched on yet, so the site stays English.
        $this->get(route('dashboard'))->assertOk();
        $this->assertSame('en', app()->getLocale());
    }
}
