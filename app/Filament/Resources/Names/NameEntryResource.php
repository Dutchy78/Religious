<?php

/*
 * The Religious Game (revival).
 * Based on "The Religious Game" by Enric Mogas Nonell, Jugando en .NET, 2004.
 * Licensed under the GNU Affero General Public License v3.0 or later. See LICENSE.
 */

declare(strict_types=1);

namespace App\Filament\Resources\Names;

use App\Filament\Resources\Names\Pages\ManageNames;
use App\Models\Content\NameEntry;
use BackedEnum;
use Filament\Actions\EditAction;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\TextInput;
use Filament\Resources\Resource;
use Filament\Schemas\Schema;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Filters\SelectFilter;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Model;
use UnitEnum;

/**
 * Admin screen for name lists. Content comes from the importer (php artisan game:import-legacy);
 * here it can be checked and its English text edited. Slugs stay fixed.
 */
class NameEntryResource extends Resource
{
    public const KINDS = [
        'surname' => 'Surname',
        'male_first' => 'First name (men)',
        'female_first' => 'First name (women)',
        'male_religious' => 'Religious name (monks)',
        'female_religious' => 'Religious name (nuns)',
        'place' => 'Place (for bynames)',
    ];

    protected static ?string $model = NameEntry::class;

    protected static ?string $slug = 'names';

    protected static string | BackedEnum | null $navigationIcon = 'heroicon-o-identification';

    protected static string | UnitEnum | null $navigationGroup = 'Monks';

    protected static ?int $navigationSort = 4;

    protected static ?string $recordTitleAttribute = 'name';

    protected static ?string $modelLabel = 'name';

    protected static ?string $pluralModelLabel = 'name lists';

    public static function form(Schema $schema): Schema
    {
        return $schema
            ->components([
                TextInput::make('name')->required()->maxLength(64),
                Select::make('kind')->required()->options(self::KINDS),
                TextInput::make('origin')->required()->maxLength(24),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                TextColumn::make('name')->searchable()->sortable(),
                TextColumn::make('kind')->badge(),
                TextColumn::make('origin')->sortable(),
                TextColumn::make('source'),
            ])
            ->filters([
                SelectFilter::make('kind')->options(self::KINDS),
                SelectFilter::make('origin')->options(fn (): array => NameEntry::query()->distinct()->orderBy('origin')->pluck('origin', 'origin')->all()),
                SelectFilter::make('source')->options(['legacy_2007' => 'Original game (2007)', 'design' => 'Design document']),
            ])
            ->defaultSort('name')
            ->recordActions([
                EditAction::make(),
            ]);
    }

    public static function canCreate(): bool
    {
        return true;
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
            'index' => ManageNames::route('/'),
        ];
    }
}
