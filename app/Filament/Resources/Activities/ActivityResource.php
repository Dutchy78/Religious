<?php

/*
 * The Religious Game (revival).
 * Based on "The Religious Game" by Enric Mogas Nonell, Jugando en .NET, 2004.
 * Licensed under the GNU Affero General Public License v3.0 or later. See LICENSE.
 */

declare(strict_types=1);

namespace App\Filament\Resources\Activities;

use App\Filament\Resources\Activities\Pages\ManageActivities;
use App\Models\Content\Activity;
use BackedEnum;
use Filament\Actions\EditAction;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\Textarea;
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
 * Admin screen for activities. Content comes from the importer (php artisan game:import-legacy);
 * here it can be checked and its English text edited. Slugs stay fixed.
 */
class ActivityResource extends Resource
{
    public const CATEGORIES = [
        'spiritual' => 'Spiritual',
        'land' => 'Land',
        'animals' => 'Animals',
        'wild' => 'Wild',
        'workshop' => 'Workshop',
        'care' => 'Care',
        'body' => 'Body',
    ];

    protected static ?string $model = Activity::class;

    protected static string|BackedEnum|null $navigationIcon = 'heroicon-o-wrench-screwdriver';

    protected static string|UnitEnum|null $navigationGroup = 'Monks';

    protected static ?int $navigationSort = 3;

    protected static ?string $recordTitleAttribute = 'name';

    public static function form(Schema $schema): Schema
    {
        return $schema
            ->components([
                TextInput::make('slug')->disabled()->dehydrated(false),
                TextInput::make('name')->required()->maxLength(255),
                Select::make('category')->required()->options(self::CATEGORIES),
                Textarea::make('description')->rows(4)->helperText('Imported from the 2007 English text where it existed: rewrite as needed.'),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->modifyQueryUsing(fn (Builder $query): Builder => $query->with(['parent']))
            ->columns([
                TextColumn::make('name')->searchable()->sortable(),
                TextColumn::make('category')->badge()->sortable(),
                TextColumn::make('parent.name')->label('Part of'),
                TextColumn::make('steps_count')->counts('steps')->label('Rule steps'),
                TextColumn::make('legacy_code')->label('Old code'),
                IconColumn::make('is_original')->boolean()->label('Original'),
            ])
            ->filters([
                SelectFilter::make('category')->options(self::CATEGORIES),
                TernaryFilter::make('is_original')->label('From the original game'),
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
            'index' => ManageActivities::route('/'),
        ];
    }
}
