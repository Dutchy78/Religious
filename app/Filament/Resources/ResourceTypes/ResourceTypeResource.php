<?php

/*
 * The Religious Game (revival).
 * Based on "The Religious Game" by Enric Mogas Nonell, Jugando en .NET, 2004.
 * Licensed under the GNU Affero General Public License v3.0 or later. See LICENSE.
 */

declare(strict_types=1);

namespace App\Filament\Resources\ResourceTypes;

use App\Filament\Resources\ResourceTypes\Pages\ManageResourceTypes;
use App\Models\Content\ResourceType;
use BackedEnum;
use Filament\Actions\EditAction;
use Filament\Forms\Components\TextInput;
use Filament\Resources\Resource;
use Filament\Schemas\Schema;
use Filament\Tables\Columns\IconColumn;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Filters\SelectFilter;
use Filament\Tables\Filters\TernaryFilter;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Model;
use UnitEnum;

/**
 * Admin screen for goods. Content comes from the importer (php artisan game:import-legacy);
 * here it can be checked and its English text edited. Slugs stay fixed.
 */
class ResourceTypeResource extends Resource
{
    protected static ?string $model = ResourceType::class;

    protected static string | BackedEnum | null $navigationIcon = 'heroicon-o-cube';

    protected static string | UnitEnum | null $navigationGroup = 'Economy';

    protected static ?int $navigationSort = 2;

    protected static ?string $recordTitleAttribute = 'name';

    protected static ?string $modelLabel = 'good';

    protected static ?string $pluralModelLabel = 'goods';

    public static function form(Schema $schema): Schema
    {
        return $schema
            ->components([
                TextInput::make('slug')->disabled()->dehydrated(false),
                TextInput::make('name')->required()->maxLength(255),
                TextInput::make('shelf_life_hours')->numeric()->required()->helperText('Game hours; 0 = keeps. One game hour is 15 real minutes.'),
                TextInput::make('need_per_inhabitant')->numeric(),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->modifyQueryUsing(fn (Builder $query): Builder => $query->with(['parent', 'unit']))
            ->columns([
                TextColumn::make('name')->searchable()->sortable(),
                TextColumn::make('parent.name')->label('Category')->sortable(),
                TextColumn::make('unit.abbreviation')->label('Unit'),
                TextColumn::make('shelf_life_hours')->label('Keeps (game h)')->sortable(),
                IconColumn::make('breeds')->boolean(),
                TextColumn::make('legacy_code')->label('Old code'),
                IconColumn::make('is_original')->boolean()->label('Original'),
            ])
            ->filters([
                SelectFilter::make('parent_slug')->label('Category')->options(fn (): array => ResourceType::query()->whereIn('slug', ResourceType::query()->whereNotNull('parent_slug')->select('parent_slug'))->orderBy('name')->pluck('name', 'slug')->all()),
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
            'index' => ManageResourceTypes::route('/'),
        ];
    }
}
