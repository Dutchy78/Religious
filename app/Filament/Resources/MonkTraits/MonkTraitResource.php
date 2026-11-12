<?php

/*
 * The Religious Game (revival).
 * Based on "The Religious Game" by Enric Mogas Nonell, Jugando en .NET, 2004.
 * Licensed under the GNU Affero General Public License v3.0 or later. See LICENSE.
 */

declare(strict_types=1);

namespace App\Filament\Resources\MonkTraits;

use App\Filament\Resources\MonkTraits\Pages\ManageMonkTraits;
use App\Models\Content\MonkTrait;
use BackedEnum;
use Filament\Actions\EditAction;
use Filament\Forms\Components\TextInput;
use Filament\Resources\Resource;
use Filament\Schemas\Schema;
use Filament\Tables\Columns\IconColumn;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Filters\SelectFilter;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Model;
use UnitEnum;

/**
 * Admin screen for monk traits. Content comes from the importer (php artisan game:import-legacy);
 * here it can be checked and its English text edited. Slugs stay fixed.
 */
class MonkTraitResource extends Resource
{
    protected static ?string $model = MonkTrait::class;

    protected static string|BackedEnum|null $navigationIcon = 'heroicon-o-sparkles';

    protected static string|UnitEnum|null $navigationGroup = 'Monks';

    protected static ?int $navigationSort = 1;

    protected static ?string $recordTitleAttribute = 'name';

    protected static ?string $modelLabel = 'trait';

    protected static ?string $pluralModelLabel = 'traits';

    public static function form(Schema $schema): Schema
    {
        return $schema
            ->components([
                TextInput::make('slug')->disabled()->dehydrated(false),
                TextInput::make('name')->required()->maxLength(255),
                TextInput::make('minimum')->numeric()->required(),
                TextInput::make('maximum')->numeric()->required(),
                TextInput::make('start_minimum')->numeric()->required(),
                TextInput::make('start_maximum')->numeric()->required(),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                TextColumn::make('name')->searchable()->sortable(),
                TextColumn::make('category')->badge(),
                TextColumn::make('applies_to'),
                TextColumn::make('scale'),
                IconColumn::make('is_inverse')->boolean()->label('Inverse'),
                TextColumn::make('start_minimum')->label('Start min'),
                TextColumn::make('start_maximum')->label('Start max'),
                TextColumn::make('legacy_code')->label('Old code'),
            ])
            ->filters([
                SelectFilter::make('category')->options(['skill' => 'Skill', 'vital' => 'Vital', 'derived' => 'Derived']),
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
            'index' => ManageMonkTraits::route('/'),
        ];
    }
}
