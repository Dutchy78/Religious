<?php

/*
 * The Religious Game (revival).
 * Based on "The Religious Game" by Enric Mogas Nonell, Jugando en .NET, 2004.
 * Licensed under the GNU Affero General Public License v3.0 or later. See LICENSE.
 */

declare(strict_types=1);

namespace App\Filament\Resources\BuildingTypes;

use App\Filament\Resources\BuildingTypes\Pages\ManageBuildingTypes;
use App\Models\Content\BuildingType;
use BackedEnum;
use Filament\Actions\EditAction;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\Textarea;
use Filament\Resources\Resource;
use Filament\Schemas\Schema;
use Filament\Tables\Columns\IconColumn;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Filters\TernaryFilter;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Model;
use UnitEnum;

/**
 * Admin screen for building types. Content comes from the importer (php artisan game:import-legacy);
 * here it can be checked and its English text edited. Slugs stay fixed.
 */
class BuildingTypeResource extends Resource
{
    protected static ?string $model = BuildingType::class;

    protected static string | BackedEnum | null $navigationIcon = 'heroicon-o-building-library';

    protected static string | UnitEnum | null $navigationGroup = 'Economy';

    protected static ?int $navigationSort = 1;

    protected static ?string $recordTitleAttribute = 'name';

    public static function form(Schema $schema): Schema
    {
        return $schema
            ->components([
                TextInput::make('slug')->disabled()->dehydrated(false),
                TextInput::make('name')->required()->maxLength(255),
                TextInput::make('build_days')->numeric()->required()->helperText('Game days. One game day is 6 real hours.'),
                Textarea::make('description')->rows(3),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->modifyQueryUsing(fn (Builder $query): Builder => $query->with(['costs.resourceType']))
            ->columns([
                TextColumn::make('name')->searchable()->sortable(),
                TextColumn::make('build_days')->label('Build (game days)')->sortable(),
                TextColumn::make('cost_summary')->label('Cost')->state(fn (BuildingType $record): string => $record->costs->map(fn ($cost): string => $cost->resourceType?->name.' '.rtrim(rtrim(number_format($cost->quantity, 2, '.', ','), '0'), '.'))->join(', '))->wrap(),
                TextColumn::make('features_count')->counts('features')->label('Features'),
                TextColumn::make('legacy_code')->label('Old code'),
                IconColumn::make('is_original')->boolean()->label('Original'),
            ])
            ->filters([
                TernaryFilter::make('is_original')->label('From the original game'),
            ])
            ->defaultSort('name')
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
            'index' => ManageBuildingTypes::route('/'),
        ];
    }
}
