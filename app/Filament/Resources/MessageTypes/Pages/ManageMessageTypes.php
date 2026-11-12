<?php

/*
 * The Religious Game (revival).
 * Based on "The Religious Game" by Enric Mogas Nonell, Jugando en .NET, 2004.
 * Licensed under the GNU Affero General Public License v3.0 or later. See LICENSE.
 */

declare(strict_types=1);

namespace App\Filament\Resources\MessageTypes\Pages;

use App\Filament\Resources\MessageTypes\MessageTypeResource;
use Filament\Resources\Pages\ManageRecords;

class ManageMessageTypes extends ManageRecords
{
    protected static string $resource = MessageTypeResource::class;
}
