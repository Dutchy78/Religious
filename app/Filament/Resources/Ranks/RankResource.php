<?php

/*
 * The Religious Game (revival).
 * Based on "The Religious Game" by Enric Mogas Nonell, Jugando en .NET, 2004.
 * Licensed under the GNU Affero General Public License v3.0 or later. See LICENSE.
 */

declare(strict_types=1);

namespace App\Filament\Resources\Ranks;

use App\Filament\Resources\Ranks\Pages\ManageRanks;
use App\Models\Content\Rank;
use BackedEnum;
use Filament\Actions\EditAction;
use Filament\Forms\Components\TextInput;
use Filament\Resources\Resource;
use Filament\Schemas\Schema;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Model;
use UnitEnum;

/**
 * Admin screen for ranks. Content comes from the importer (php artisan game:import-legacy);
 * here it can be checked and its English text edited. Slugs stay fixed.
 */
class RankResource extends Resource
{
    protected static ?string $model = Rank::class;

    protected static string|BackedEnum|null $navigationIcon = 'heroicon-o-chevron-double-up';

    protected static string|UnitEnum|null $navigationGroup = 'Monks';

    protected static ?int $navigationSort = 2;

    protected static ?string $recordTitleAttribute = 'name';

    public static function form(Schema $schema): Schema
    {
        return $schema
            ->components([
                TextInput::make('slug')->disabled()->dehydrated(false),
                TextInput::make('name')->required()->maxLength(255),
                TextInput::make('female_name')->required()->maxLength(255),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                TextColumn::make('position')->sortable(),
                TextColumn::make('name'),
                TextColumn::make('female_name'),
            ])
            ->defaultSort('position')
            ->recordActions([
                EditAction::make(),
            ]);
    }

    public static function canCreate(): bool
    {
        return false;
    }

    public static function canDelete(Model $record): bool
    {
        return false;
    }

    public static function canDeleteAny(): bool
    {
        return false;
    }

    public static function getPages(): array
    {
        return [
            'index' => ManageRanks::route('/'),
        ];
    }
}
