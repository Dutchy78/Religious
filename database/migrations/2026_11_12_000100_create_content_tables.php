<?php

/*
 * The Religious Game (revival).
 * Based on "The Religious Game" by Enric Mogas Nonell, Jugando en .NET, 2004.
 * Licensed under the GNU Affero General Public License v3.0 or later. See LICENSE.
 */

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

/**
 * Game content: the data that defines the game (buildings, goods,
 * activities, ...), as opposed to the state of a running world.
 *
 * Content uses English slugs as string primary keys. Tables imported from
 * the original game keep the original 3-letter code in `legacy_code`.
 * English text lives on the content table itself; other languages (and the
 * original 2007 texts) live in `translations`.
 */
return new class extends Migration
{
    public function up(): void
    {
        $slug = fn (Blueprint $table) => $table->string('slug', 64)->primary();
        $legacy = fn (Blueprint $table) => $table->string('legacy_code', 8)->nullable()->index();
        $ref = function (Blueprint $table, string $column, string $on, bool $nullable = true): void {
            $definition = $table->string($column, 64);

            if ($nullable) {
                $definition->nullable();
            }

            $table->foreign($column)->references('slug')->on($on)->cascadeOnUpdate()->restrictOnDelete();
        };

        Schema::create('languages', function (Blueprint $table) {
            $table->string('code', 8)->primary();
            $table->string('name');
            $table->string('native_name');
            $table->string('date_format', 32);
            $table->string('decimal_separator', 1);
            $table->string('thousands_separator', 1);
            $table->boolean('is_active')->default(false);
            $table->timestamps();
        });

        Schema::create('units', function (Blueprint $table) use ($slug, $legacy) {
            $slug($table);
            $legacy($table);
            $table->string('name');
            $table->string('abbreviation', 16);
            $table->timestamps();
        });

        Schema::create('orders', function (Blueprint $table) use ($slug, $legacy) {
            $slug($table);
            $legacy($table);
            $table->string('name');
            $table->string('founder');
            $table->smallInteger('founded_year');
            $table->string('character');
            $table->string('strength');
            $table->string('weakness');
            $table->boolean('is_original')->default(false);
            $table->timestamps();
        });

        Schema::create('regions', function (Blueprint $table) use ($slug, $legacy) {
            $slug($table);
            $legacy($table);
            $table->string('name');
            $table->unsignedInteger('population')->nullable();
            $table->string('weather_station');
            $table->boolean('has_coast')->default(false);
            $table->string('feature');
            $table->boolean('is_original')->default(false);
            $table->timestamps();
        });

        Schema::create('region_climates', function (Blueprint $table) use ($ref) {
            $table->id();
            $ref($table, 'region_slug', 'regions', nullable: false);
            $table->unsignedTinyInteger('month');
            $table->decimal('mean_temperature', 4, 1);
            $table->unsignedSmallInteger('precipitation_mm');
            $table->unique(['region_slug', 'month']);
        });

        Schema::create('periods', function (Blueprint $table) use ($slug) {
            $slug($table);
            $table->string('name');
            $table->unsignedTinyInteger('position')->unique();
            $table->unsignedTinyInteger('starts_at_hour');
            $table->unsignedTinyInteger('length_hours');
            $table->boolean('is_schedulable');
            $table->timestamps();
        });

        Schema::create('ranks', function (Blueprint $table) use ($slug, $legacy) {
            $slug($table);
            $legacy($table);
            $table->string('name');
            $table->string('female_name');
            $table->unsignedTinyInteger('position');
            $table->timestamps();
        });

        Schema::create('traits', function (Blueprint $table) use ($slug, $legacy) {
            $slug($table);
            $legacy($table);
            $table->string('name');
            $table->string('category', 16);   // skill, vital, derived
            $table->string('applies_to', 16); // monk, monastery, building
            $table->string('scale', 16);      // linear, exponential, logarithmic
            $table->boolean('is_inverse')->default(false);
            $table->integer('minimum');
            $table->integer('maximum');
            $table->integer('start_minimum');
            $table->integer('start_maximum');
            $table->timestamps();
        });

        Schema::create('trait_age_factors', function (Blueprint $table) use ($ref) {
            $table->id();
            $ref($table, 'trait_slug', 'traits', nullable: false);
            $table->unsignedTinyInteger('age_from');
            $table->unsignedTinyInteger('age_to');
            $table->decimal('factor', 5, 3);
        });

        Schema::create('resource_types', function (Blueprint $table) use ($slug, $legacy, $ref) {
            $slug($table);
            $legacy($table);
            $table->string('name');
            $ref($table, 'parent_slug', 'resource_types');
            $ref($table, 'unit_slug', 'units');
            $table->unsignedTinyInteger('decimals')->default(0);
            $table->unsignedInteger('shelf_life_hours')->default(0); // 0 = keeps
            $table->boolean('is_assignable')->default(false);
            $table->boolean('is_currency')->default(false);
            $table->boolean('is_unique')->default(false); // tracked one by one (animals, relics)
            $table->boolean('breeds')->default(false);
            $table->unsignedInteger('breed_every_hours')->nullable();
            $table->unsignedSmallInteger('offspring_minimum')->nullable();
            $table->unsignedSmallInteger('offspring_maximum')->nullable();
            $table->unsignedInteger('gestation_hours')->nullable();
            $table->unsignedInteger('lifespan_hours')->nullable();
            $table->decimal('need_per_inhabitant', 14, 6)->nullable();
            $table->boolean('is_original')->default(false);
            $table->timestamps();
        });

        Schema::create('activities', function (Blueprint $table) use ($slug, $legacy, $ref) {
            $slug($table);
            $legacy($table);
            $table->string('name');
            $table->string('category', 16); // spiritual, land, animals, wild, workshop, care, body
            $ref($table, 'parent_slug', 'activities');
            $table->text('description')->nullable();
            $table->unsignedSmallInteger('position')->default(0);
            $table->boolean('is_original')->default(false);
            $table->timestamps();
        });

        Schema::create('building_types', function (Blueprint $table) use ($slug, $legacy) {
            $slug($table);
            $legacy($table);
            $table->string('name');
            $table->text('description')->nullable();
            $table->unsignedSmallInteger('build_days');
            $table->unsignedSmallInteger('original_build_days')->nullable();
            $table->boolean('is_original')->default(false);
            $table->timestamps();
        });

        Schema::create('offices', function (Blueprint $table) use ($slug, $ref) {
            $slug($table);
            $table->string('name');
            $table->string('female_name');
            $table->string('responsibility');
            $ref($table, 'required_building_slug', 'building_types');
            $table->string('requirements');
            $table->string('effect');
            $table->unsignedTinyInteger('position');
            $table->timestamps();
        });

        Schema::create('building_costs', function (Blueprint $table) use ($ref) {
            $table->id();
            $ref($table, 'building_type_slug', 'building_types', nullable: false);
            $ref($table, 'resource_slug', 'resource_types', nullable: false);
            $table->decimal('quantity', 14, 4);
            $table->unique(['building_type_slug', 'resource_slug']);
        });

        Schema::create('field_states', function (Blueprint $table) use ($slug, $legacy) {
            $slug($table);
            $legacy($table);
            $table->string('name');
            $table->unsignedTinyInteger('position');
            $table->boolean('holds_resource');
            $table->timestamps();
        });

        Schema::create('building_features', function (Blueprint $table) use ($ref) {
            $table->id();
            $ref($table, 'building_type_slug', 'building_types', nullable: false);
            $table->string('kind', 32); // activity_places, storage, trait_bonus, holds, field_state_places
            $ref($table, 'activity_slug', 'activities');
            $ref($table, 'field_state_slug', 'field_states');
            $ref($table, 'resource_slug', 'resource_types');
            $ref($table, 'trait_slug', 'traits');
            $table->decimal('amount', 16, 4)->nullable();
            $table->unsignedSmallInteger('position')->default(0);
        });

        Schema::create('field_state_transitions', function (Blueprint $table) use ($ref) {
            $table->id();
            $ref($table, 'building_type_slug', 'building_types');
            $ref($table, 'resource_slug', 'resource_types');
            $table->unsignedSmallInteger('position');
            $ref($table, 'from_state_slug', 'field_states');
            $ref($table, 'to_state_slug', 'field_states');
            $ref($table, 'activity_slug', 'activities');
        });

        Schema::create('message_types', function (Blueprint $table) use ($slug, $legacy) {
            $slug($table);
            $legacy($table);
            $table->string('title');
            $table->string('text'); // placeholders :p1 .. :p4
            $table->unsignedInteger('original_lifetime_hours')->nullable();
            $table->boolean('sends_email')->default(false);
            $table->timestamps();
        });

        Schema::create('transformations', function (Blueprint $table) use ($ref) {
            $table->id();
            $ref($table, 'resource_slug', 'resource_types', nullable: false);
            $ref($table, 'from_state_slug', 'field_states');
            $ref($table, 'activity_slug', 'activities');
            $ref($table, 'to_state_slug', 'field_states');
            $ref($table, 'becomes_resource_slug', 'resource_types', nullable: false);
            $table->unsignedInteger('hours_minimum');
            $table->unsignedInteger('hours_maximum');
            $table->decimal('quantity', 14, 4);
            $ref($table, 'message_type_slug', 'message_types');
            $table->boolean('replaces')->default(true);
        });

        Schema::create('recipes', function (Blueprint $table) use ($ref) {
            $table->id();
            $ref($table, 'output_resource_slug', 'resource_types', nullable: false);
            $ref($table, 'activity_slug', 'activities', nullable: false);
            $ref($table, 'input_resource_slug', 'resource_types', nullable: false);
            $table->decimal('need_minimum', 18, 8);
            $table->decimal('need_maximum', 18, 8);
        });

        Schema::create('activity_steps', function (Blueprint $table) use ($ref) {
            $table->id();
            $ref($table, 'activity_slug', 'activities'); // null = every monk, every slot
            $table->unsignedSmallInteger('position');
            $table->string('type', 8);
            $table->string('calculation', 8)->nullable();
            $ref($table, 'building_type_slug', 'building_types');
            $ref($table, 'trait_slug', 'traits');
            $ref($table, 'resource_slug', 'resource_types');
            $table->decimal('parameter1', 14, 4)->nullable();
            $table->decimal('parameter2', 14, 4)->nullable();
            $ref($table, 'message_type_slug', 'message_types');
            $table->boolean('is_global_message')->default(false);
            $table->index(['activity_slug', 'position']);
        });

        Schema::create('event_types', function (Blueprint $table) use ($slug, $legacy) {
            $slug($table);
            $legacy($table);
            $table->string('name');
            $table->string('scope', 16); // region, monastery, building, monk, expedition
            $table->unsignedInteger('period_hours')->nullable();
            $table->text('description')->nullable();
            $table->boolean('is_original')->default(false);
            $table->timestamps();
        });

        Schema::create('event_choices', function (Blueprint $table) use ($ref) {
            $table->id();
            $ref($table, 'event_type_slug', 'event_types', nullable: false);
            $table->unsignedTinyInteger('position');
            $table->string('action', 32);
            $table->decimal('amount', 14, 2)->default(0);
        });

        Schema::create('parcel_types', function (Blueprint $table) use ($slug) {
            $slug($table);
            $table->string('name');
            $table->string('used_for');
            $table->timestamps();
        });

        Schema::create('names', function (Blueprint $table) {
            $table->id();
            $table->string('kind', 24);   // surname, male_first, female_first, male_religious, female_religious, place
            $table->string('origin', 24); // a region slug, everywhere, england, france
            $table->string('name', 64);
            $table->string('source', 16); // legacy_2007, design
            $table->unique(['kind', 'origin', 'name']);
        });

        Schema::create('translations', function (Blueprint $table) {
            $table->id();
            $table->string('translatable_type', 64); // content table, or ui_strings / legacy_* for reference
            $table->string('translatable_key', 64);
            $table->string('locale', 8);
            $table->string('field', 32);
            $table->text('value');
            $table->string('source', 16); // legacy_2007, manual
            $table->timestamps();
            $table->unique(['translatable_type', 'translatable_key', 'locale', 'field', 'source'], 'translations_unique');
        });
    }

    public function down(): void
    {
        foreach ([
            'translations', 'names', 'parcel_types', 'event_choices', 'event_types', 'activity_steps',
            'recipes', 'transformations', 'message_types', 'field_state_transitions', 'building_features',
            'field_states', 'building_costs', 'offices', 'building_types', 'activities', 'resource_types',
            'trait_age_factors', 'traits', 'ranks', 'periods', 'region_climates', 'regions', 'orders',
            'units', 'languages',
        ] as $table) {
            Schema::dropIfExists($table);
        }
    }
};
