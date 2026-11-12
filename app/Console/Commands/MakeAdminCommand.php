<?php

/*
 * The Religious Game (revival).
 * Based on "The Religious Game" by Enric Mogas Nonell, Jugando en .NET, 2004.
 * Licensed under the GNU Affero General Public License v3.0 or later. See LICENSE.
 */

declare(strict_types=1);

namespace App\Console\Commands;

use App\Models\User;
use Illuminate\Console\Command;

class MakeAdminCommand extends Command
{
    protected $signature = 'game:make-admin {email : E-mail address of an existing account}';

    protected $description = 'Give an account access to the admin panel (/admin)';

    public function handle(): int
    {
        $user = User::query()->where('email', $this->argument('email'))->first();

        if ($user === null) {
            $this->error('No account with that e-mail address. Register first at /register.');

            return self::FAILURE;
        }

        $user->forceFill(['is_admin' => true])->save();

        $this->info("{$user->email} is now an admin.");

        if (! $user->hasVerifiedEmail()) {
            $this->warn('The e-mail address is not verified yet; the admin panel opens after verification.');
        }

        return self::SUCCESS;
    }
}
