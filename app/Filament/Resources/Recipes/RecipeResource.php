<?php

/*
 * The Religious Game (revival).
 * Based on "The Religious Game" by Enric Mogas Nonell, Jugando en .NET, 2004.
 * Licensed under the GNU Affero General Public License v3.0 or later. See LICENSE.
 */

declare(strict_types=1);

namespace App\Filament\Resources\Recipes;

use App\Filament\Resources\Recipes\Pages\ManageRecipes;
use App\Models\Content\Recipe;
use BackedEnum;
use Filament\Actions\EditAction;
use Filament\Forms\Components\TextInput;
use Filament\Resources\Resource;
use Filament\Schemas\Schema;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Model;
use UnitEnum;

/**
 * Admin screen for recipes. Content comes from the importer (php artisan game:import-legacy);
 * here it can be checked and its English text edited. Slugs stay fixed.
 */
class RecipeResource extends Resource
{
    protected static ?string $model = Recipe::class;

    protected static string|BackedEnum|null $navigationIcon = 'heroicon-o-beaker';

    protected static string|UnitEnum|null $navigationGroup = 'Economy';

    protected static ?int $navigationSort = 3;

    protected static ?string $recordTitleAttribute = 'id';

    public static function form(Schema $schema): Schema
    {
        return $schema
            ->components([
                TextInput::make('need_minimum')->numeric()->required(),
                TextInput::make('need_maximum')->numeric()->required(),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->modifyQueryUsing(fn (Builder $query): Builder => $query->with(['output', 'input', 'activity']))
            ->columns([
                TextColumn::make('output.name')->label('Makes')->searchable(),
                TextColumn::make('activity.name')->label('By'),
                TextColumn::make('input.name')->label('From'),
                TextColumn::make('need_minimum')->label('Min per unit'),
                TextColumn::make('need_maximum')->label('Max per unit'),
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
            'index' => ManageRecipes::route('/'),
        ];
    }
}
