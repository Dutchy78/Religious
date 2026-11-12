<?php

/*
 * The Religious Game (revival).
 * Based on "The Religious Game" by Enric Mogas Nonell, Jugando en .NET, 2004.
 * Licensed under the GNU Affero General Public License v3.0 or later. See LICENSE.
 */

declare(strict_types=1);

namespace App\Filament\Resources\MonasticOrders;

use App\Filament\Resources\MonasticOrders\Pages\ManageMonasticOrders;
use App\Models\Content\MonasticOrder;
use BackedEnum;
use Filament\Actions\EditAction;
use Filament\Forms\Components\TextInput;
use Filament\Resources\Resource;
use Filament\Schemas\Schema;
use Filament\Tables\Columns\IconColumn;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Model;
use UnitEnum;

/**
 * Admin screen for monastic orders. Content comes from the importer (php artisan game:import-legacy);
 * here it can be checked and its English text edited. Slugs stay fixed.
 */
class MonasticOrderResource extends Resource
{
    protected static ?string $model = MonasticOrder::class;

    protected static string|BackedEnum|null $navigationIcon = 'heroicon-o-flag';

    protected static string|UnitEnum|null $navigationGroup = 'World';

    protected static ?int $navigationSort = 1;

    protected static ?string $recordTitleAttribute = 'name';

    protected static ?string $modelLabel = 'order';

    protected static ?string $pluralModelLabel = 'orders';

    public static function form(Schema $schema): Schema
    {
        return $schema
            ->components([
                TextInput::make('slug')->disabled()->dehydrated(false),
                TextInput::make('name')->required()->maxLength(255),
                TextInput::make('founder')->required()->maxLength(255),
                TextInput::make('founded_year')->numeric()->required(),
                TextInput::make('character')->required()->maxLength(255),
                TextInput::make('strength')->required()->maxLength(255),
                TextInput::make('weakness')->required()->maxLength(255),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                TextColumn::make('name')->searchable()->sortable(),
                TextColumn::make('founder'),
                TextColumn::make('founded_year')->sortable(),
                TextColumn::make('strength')->limit(50)->wrap(),
                IconColumn::make('is_original')->boolean()->label('Original'),
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
            'index' => ManageMonasticOrders::route('/'),
        ];
    }
}
