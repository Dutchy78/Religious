<?php

/*
 * The Religious Game (revival).
 * Based on "The Religious Game" by Enric Mogas Nonell, Jugando en .NET, 2004.
 * Licensed under the GNU Affero General Public License v3.0 or later. See LICENSE.
 */

declare(strict_types=1);

namespace App\Filament\Resources\Translations;

use App\Filament\Resources\Translations\Pages\ManageTranslations;
use App\Models\Content\Translation;
use BackedEnum;
use Filament\Actions\EditAction;
use Filament\Forms\Components\Textarea;
use Filament\Forms\Components\TextInput;
use Filament\Resources\Resource;
use Filament\Schemas\Schema;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Filters\SelectFilter;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Model;
use UnitEnum;

/**
 * Admin screen for translations. Content comes from the importer (php artisan game:import-legacy);
 * here it can be checked and its English text edited. Slugs stay fixed.
 */
class TranslationResource extends Resource
{
    protected static ?string $model = Translation::class;

    protected static string|BackedEnum|null $navigationIcon = 'heroicon-o-language';

    protected static string|UnitEnum|null $navigationGroup = 'Reference';

    protected static ?int $navigationSort = 1;

    protected static ?string $recordTitleAttribute = 'value';

    protected static ?string $modelLabel = 'translation';

    protected static ?string $pluralModelLabel = 'translations';

    public static function form(Schema $schema): Schema
    {
        return $schema
            ->components([
                TextInput::make('translatable_type')->disabled()->dehydrated(false),
                TextInput::make('translatable_key')->disabled()->dehydrated(false),
                TextInput::make('locale')->disabled()->dehydrated(false),
                Textarea::make('value')->required()->rows(4),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                TextColumn::make('translatable_type')->label('Table')->sortable(),
                TextColumn::make('translatable_key')->label('Key')->searchable(),
                TextColumn::make('locale')->badge(),
                TextColumn::make('field'),
                TextColumn::make('value')->limit(80)->wrap()->searchable(),
                TextColumn::make('source')->badge(),
            ])
            ->filters([
                SelectFilter::make('translatable_type')->label('Table')->options(fn (): array => Translation::query()->distinct()->orderBy('translatable_type')->pluck('translatable_type', 'translatable_type')->all()),
                SelectFilter::make('locale')->options(['en' => 'English', 'es' => 'Spanish', 'ca' => 'Catalan']),
                SelectFilter::make('source')->options(['legacy_2007' => 'Original game (2007)', 'manual' => 'Entered by hand']),
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
            'index' => ManageTranslations::route('/'),
        ];
    }
}
