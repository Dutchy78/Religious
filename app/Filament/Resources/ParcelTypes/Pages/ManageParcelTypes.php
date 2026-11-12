<?php

/*
 * The Religious Game (revival).
 * Based on "The Religious Game" by Enric Mogas Nonell, Jugando en .NET, 2004.
 * Licensed under the GNU Affero General Public License v3.0 or later. See LICENSE.
 */

declare(strict_types=1);

namespace App\Filament\Resources\ParcelTypes\Pages;

use App\Filament\Resources\ParcelTypes\ParcelTypeResource;
use Filament\Resources\Pages\ManageRecords;

class ManageParcelTypes extends ManageRecords
{
    protected static string $resource = ParcelTypeResource::class;
}
