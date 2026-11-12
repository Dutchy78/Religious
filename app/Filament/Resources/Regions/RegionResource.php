<?php

/*
 * The Religious Game (revival).
 * Based on "The Religious Game" by Enric Mogas Nonell, Jugando en .NET, 2004.
 * Licensed under the GNU Affero General Public License v3.0 or later. See LICENSE.
 */

declare(strict_types=1);

namespace App\Filament\Resources\Regions;

use App\Filament\Resources\Regions\Pages\ManageRegions;
use App\Models\Content\Region;
use BackedEnum;
use Filament\Actions\EditAction;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\Toggle;
use Filament\Resources\Resource;
use Filament\Schemas\Schema;
use Filament\Tables\Columns\IconColumn;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Model;
use UnitEnum;

/**
 * Admin screen for regions. Content comes from the importer (php artisan game:import-legacy);
 * here it can be checked and its English text edited. Slugs stay fixed.
 */
class RegionResource extends Resource
{
    protected static ?string $model = Region::class;

    protected static string|BackedEnum|null $navigationIcon = 'heroicon-o-map';

    protected static string|UnitEnum|null $navigationGroup = 'World';

    protected static ?int $navigationSort = 2;

    protected static ?string $recordTitleAttribute = 'name';

    public static function form(Schema $schema): Schema
    {
        return $schema
            ->components([
                TextInput::make('slug')->disabled()->dehydrated(false),
                TextInput::make('name')->required()->maxLength(255),
                TextInput::make('population')->numeric(),
                TextInput::make('weather_station')->required()->maxLength(255),
                Toggle::make('has_coast'),
                TextInput::make('feature')->required()->maxLength(255),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->modifyQueryUsing(fn (Builder $query): Builder => $query->with(['climates']))
            ->columns([
                TextColumn::make('name')->searchable()->sortable(),
                TextColumn::make('population')->numeric()->sortable(),
                TextColumn::make('weather_station'),
                IconColumn::make('has_coast')->boolean(),
                TextColumn::make('feature')->wrap(),
                TextColumn::make('january')->label('Jan °C')->state(fn (Region $record): ?float => $record->climates->firstWhere('month', 1)?->mean_temperature),
                TextColumn::make('july')->label('Jul °C')->state(fn (Region $record): ?float => $record->climates->firstWhere('month', 7)?->mean_temperature),
            ])
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
            'index' => ManageRegions::route('/'),
        ];
    }
}
