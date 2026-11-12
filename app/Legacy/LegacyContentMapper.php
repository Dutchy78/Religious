<?php

/*
 * The Religious Game (revival).
 * Based on "The Religious Game" by Enric Mogas Nonell, Jugando en .NET, 2004.
 * Licensed under the GNU Affero General Public License v3.0 or later. See LICENSE.
 */

declare(strict_types=1);

namespace App\Legacy;

/**
 * Turns the original game's content tables into rows for the revival's
 * content tables (English slugs, English source text).
 *
 * Player data (USUARIO, EQUIPO, HOMBRE, ...) is deliberately not mapped: the
 * recovered database only holds one 2007 test account.
 *
 * The original Spanish, Catalan and English texts are kept as rows for the
 * `translations` table with source "legacy_2007", as reference for
 * translators. They are not shown to players.
 *
 * Framework independent: returns plain arrays, collects warnings for
 * anything it cannot map instead of failing.
 */
final class LegacyContentMapper
{
    public const SOURCE = 'legacy_2007';

    /** @var list<string> */
    private array $warnings = [];

    public function __construct(private readonly SqlDumpReader $reader) {}

    /** @return list<string> */
    public function warnings(): array
    {
        return array_values(array_unique($this->warnings));
    }

    /** @return array<string, list<array<string, mixed>>> */
    public function tables(): array
    {
        $this->warnings = [];

        return [
            'units' => $this->units(),
            'traits' => $this->traits(),
            'trait_age_factors' => $this->traitAgeFactors(),
            'resource_types' => $this->resourceTypes(),
            'activities' => $this->activities(),
            'building_types' => $this->buildingTypes(),
            'building_costs' => $this->buildingCosts(),
            'building_features' => $this->buildingFeatures(),
            'field_states' => $this->fieldStates(),
            'field_state_transitions' => $this->fieldStateTransitions(),
            'transformations' => $this->transformations(),
            'recipes' => $this->recipes(),
            'message_types' => $this->messageTypes(),
            'activity_steps' => $this->activitySteps(),
            'event_types' => $this->eventTypes(),
            'event_choices' => $this->eventChoices(),
            'names' => $this->names(),
            'translations' => $this->translations(),
        ];
    }

    /**
     * Original game settings (_PARAMETROS), for reference.
     *
     * @return array<string, string|null>
     */
    public function originalSettings(): array
    {
        return $this->reader->rows('_PARAMETROS')[0] ?? [];
    }

    // ------------------------------------------------------------------
    // Content tables
    // ------------------------------------------------------------------

    /** @return list<array<string, mixed>> */
    private function units(): array
    {
        $rows = [];

        foreach ($this->reader->rows('_UNIDAD_MEDIDA') as $row) {
            $code = (string) $row['UNIDADID'];

            if (! isset(LegacyMap::UNITS[$code])) {
                $this->warn("Unit '{$code}' has no mapping and was skipped.");

                continue;
            }

            [$slug, $name, $abbreviation] = LegacyMap::UNITS[$code];
            $rows[] = ['slug' => $slug, 'legacy_code' => $code, 'name' => $name, 'abbreviation' => $abbreviation];
        }

        return $rows;
    }

    /** @return list<array<string, mixed>> */
    private function traits(): array
    {
        $rows = [];

        foreach ($this->reader->rows('_CARACTERISTICA') as $row) {
            $code = (string) $row['CARACTERISTICAID'];
            $slug = $this->traitSlug($code);

            if ($slug === null) {
                continue;
            }

            $rows[] = [
                'slug' => $slug,
                'legacy_code' => $code,
                'name' => LegacyMap::TRAITS[$code][1],
                'category' => LegacyMap::TRAIT_GROUPS[$row['TIPO_CARACTERISTICA'] ?? ''] ?? 'derived',
                'applies_to' => LegacyMap::TRAIT_APPLIES_TO[$row['APLICABLE_A'] ?? ''] ?? 'monk',
                'scale' => LegacyMap::TRAIT_SCALES[$row['TIPO'] ?? ''] ?? 'linear',
                'is_inverse' => $row['INVERSA'] === '1',
                'minimum' => (int) $row['MINIMO'],
                'maximum' => (int) $row['MAXIMO'],
                'start_minimum' => (int) $row['MINIMO_CREACION'],
                'start_maximum' => (int) $row['MAXIMO_CREACION'],
            ];
        }

        return $rows;
    }

    /** @return list<array<string, mixed>> */
    private function traitAgeFactors(): array
    {
        $rows = [];

        foreach ($this->reader->rows('_CARACTERISTICA_EDAD') as $row) {
            $slug = $this->traitSlug((string) $row['CARACTERISTICAID']);

            if ($slug === null) {
                continue;
            }

            $rows[] = [
                'trait_slug' => $slug,
                'age_from' => (int) $row['DESDE'],
                'age_to' => (int) $row['HASTA'],
                'factor' => (float) $row['CORRECTOR'],
            ];
        }

        return $rows;
    }

    /** @return list<array<string, mixed>> */
    private function resourceTypes(): array
    {
        $rows = [];

        foreach ($this->reader->rows('_RECURSO_TIPO') as $row) {
            $code = (string) $row['RECURSOID'];

            if (! isset(LegacyMap::RESOURCES[$code])) {
                continue; // unnamed codes (acr, cc2, cct, '') are unused
            }

            [$slug, $name] = LegacyMap::RESOURCES[$code];
            $parent = $this->blank($row['TIPO_RECURSO']) ? null : $this->resourceSlug($row['TIPO_RECURSO'], "parent of {$slug}");
            $unit = $this->blank($row['UNIDADID']) ? null : (LegacyMap::UNITS[$row['UNIDADID']][0] ?? null);

            $rows[] = [
                'slug' => $slug,
                'legacy_code' => $code,
                'name' => $name,
                'parent_slug' => $parent,
                'unit_slug' => $unit,
                'decimals' => (int) $row['DECIMALES'],
                'shelf_life_hours' => (int) $row['CADUCIDAD'],
                'is_assignable' => $row['ASIGNABLE'] === '1',
                'is_currency' => $row['MONEDA_MERCADO'] === '1',
                'is_unique' => $row['UNICO'] === '1',
                'breeds' => $row['REPRODUCIBLE'] === '1',
                'breed_every_hours' => $this->intOrNull($row['REPRODUCIR_CADA']),
                'offspring_minimum' => $this->intOrNull($row['MINIMO_CRIAS']),
                'offspring_maximum' => $this->intOrNull($row['MAXIMO_CRIAS']),
                'gestation_hours' => $this->intOrNull($row['TIEMPO_GESTACION']),
                'lifespan_hours' => $this->intOrNull($row['TIEMPO_VITAL']),
                'need_per_inhabitant' => $this->floatOrNull($row['NECESIDAD_HABITANTE']),
                'is_original' => true,
            ];
        }

        return $rows;
    }

    /** @return list<array<string, mixed>> */
    private function activities(): array
    {
        $comments = $this->texts('_ACTIVIDADT', 'ACTIVIDADID', 'COMENTARIOS', 'en');
        $rows = [];
        $position = 0;

        foreach (LegacyMap::ACTIVITIES as $code => [$slug, $name, $group]) {
            $row = $this->find('_ACTIVIDAD', 'ACTIVIDADID', $code);

            if ($row === null) {
                $this->warn("Activity '{$code}' is in the map but not in the dump.");

                continue;
            }

            $category = $row['CATEGORIA'];

            $rows[] = [
                'slug' => $slug,
                'legacy_code' => $code,
                'name' => $name,
                'category' => $group,
                'parent_slug' => $this->blank($category) ? null : (LegacyMap::ACTIVITIES[$category][0] ?? null),
                // The 2007 English comment is a draft to rewrite in the admin panel.
                'description' => isset($comments[$code]) ? $this->cleanText($comments[$code]) : null,
                'position' => ++$position,
                'is_original' => true,
            ];
        }

        foreach ($this->reader->rows('_ACTIVIDAD') as $row) {
            if (! isset(LegacyMap::ACTIVITIES[$row['ACTIVIDADID']])) {
                $this->warn("Activity '{$row['ACTIVIDADID']}' has no mapping and was skipped.");
            }
        }

        return $rows;
    }

    /** @return list<array<string, mixed>> */
    private function buildingTypes(): array
    {
        $rows = [];

        foreach ($this->reader->rows('_EDIFICIO_TIPO') as $row) {
            $code = (string) $row['TIPOEDIFICIOID'];
            $slug = $this->buildingSlug($code, 'building types');

            if ($slug === null) {
                continue;
            }

            $days = intdiv((int) $row['TIEMPO_CONSTRUCCION'], 24);

            $rows[] = [
                'slug' => $slug,
                'legacy_code' => $code,
                'name' => LegacyMap::BUILDING_TYPES[$code][1],
                'build_days' => LegacyMap::BUILD_DAYS_OVERRIDES[$slug] ?? $days,
                'original_build_days' => $days,
                'is_original' => true,
            ];
        }

        return $rows;
    }

    /** @return list<array<string, mixed>> */
    private function buildingCosts(): array
    {
        $rows = [];

        foreach ($this->reader->rows('_COSTE_EDIFICIO') as $row) {
            $building = $this->buildingSlug((string) $row['TIPOEDIFICIOID'], 'building costs');
            $resource = $this->resourceSlug($row['RECURSOID'], 'building costs');

            if ($building === null || $resource === null) {
                continue;
            }

            $rows[] = ['building_type_slug' => $building, 'resource_slug' => $resource, 'quantity' => (float) $row['CANTIDAD']];
        }

        return $rows;
    }

    /** @return list<array<string, mixed>> */
    private function buildingFeatures(): array
    {
        $rows = [];

        foreach ($this->reader->rows('_UTILIDAD_TIPO_EDIFICIO') as $row) {
            $utility = (string) $row['UTILIDADID'];
            $building = $this->buildingSlug((string) $row['TIPOEDIFICIOID'], "building feature '{$utility}'");

            if ($building === null) {
                continue;
            }

            $kind = LegacyMap::FEATURE_KINDS[$utility] ?? null;

            if ($kind === null) {
                $this->warn("Building feature '{$utility}' of {$building} has no mapping and was skipped.");

                continue;
            }

            $resource = null;

            if (! $this->blank($row['RECURSOID'])) {
                $resource = $this->resourceSlug($row['RECURSOID'], "{$building} feature");

                if ($resource === null) {
                    continue;
                }
            }

            $activity = null;
            $state = null;

            if (! $this->blank($row['ACTIVIDADID'])) {
                if ($kind === 'field_state_places') {
                    $state = LegacyMap::FIELD_STATES[$row['ACTIVIDADID']][0] ?? null;
                } else {
                    $activity = LegacyMap::ACTIVITIES[$row['ACTIVIDADID']][0] ?? null;
                }
            }

            $rows[] = [
                'building_type_slug' => $building,
                'kind' => $kind,
                'activity_slug' => $activity,
                'field_state_slug' => $state,
                'resource_slug' => $resource,
                'trait_slug' => $this->blank($row['CARACTERISTICAID']) ? null : $this->traitSlug((string) $row['CARACTERISTICAID']),
                'amount' => $this->floatOrNull($row['ALMACENAJE']) ?? $this->floatOrNull($row['PERSONAS']),
                'position' => (int) $row['ORDEN'],
            ];
        }

        return $rows;
    }

    /** @return list<array<string, mixed>> */
    private function fieldStates(): array
    {
        $legacy = [];

        foreach ($this->reader->rows('_ESTADO') as $row) {
            $legacy[$row['ESTADOID']] = $row;
        }

        $rows = [];

        foreach (LegacyMap::FIELD_STATES as $code => [$slug, $name]) {
            $rows[] = [
                'slug' => $slug,
                'legacy_code' => $code,
                'name' => $name,
                'position' => isset($legacy[$code]) ? (int) $legacy[$code]['ORDEN'] : 9,
                'holds_resource' => isset($legacy[$code]) ? $legacy[$code]['RECURSO'] === '1' : true,
            ];
        }

        return $rows;
    }

    /** @return list<array<string, mixed>> */
    private function fieldStateTransitions(): array
    {
        $rows = [];

        foreach ($this->reader->rows('_ESTADO_RECURSO') as $row) {
            $rows[] = [
                'building_type_slug' => $this->buildingSlug((string) $row['TIPOEDIFICIOID'], 'field state transitions'),
                'resource_slug' => $this->blank($row['RECURSOID']) ? null : $this->resourceSlug($row['RECURSOID'], 'field state transitions'),
                'position' => (int) $row['ORDEN'],
                'from_state_slug' => $this->stateSlug($row['ORIGENID']),
                'to_state_slug' => $this->stateSlug($row['DESTINOID']),
                'activity_slug' => $this->blank($row['ACTIVIDADID']) ? null : (LegacyMap::ACTIVITIES[$row['ACTIVIDADID']][0] ?? null),
            ];
        }

        return $rows;
    }

    /** @return list<array<string, mixed>> */
    private function transformations(): array
    {
        $rows = [];

        foreach ($this->reader->rows('_TRANSFORMACION') as $row) {
            $resource = $this->resourceSlug($row['RECURSOID'], 'transformations');
            $becomes = $this->resourceSlug($row['TRANSFORMA_EN'], 'transformations');

            if ($resource === null || $becomes === null) {
                continue;
            }

            $rows[] = [
                'resource_slug' => $resource,
                'from_state_slug' => $this->stateSlug($row['ORIGENID']),
                'activity_slug' => $this->blank($row['ACTIVIDADID']) ? null : (LegacyMap::ACTIVITIES[$row['ACTIVIDADID']][0] ?? null),
                'to_state_slug' => $this->stateSlug($row['DESTINOID']),
                'becomes_resource_slug' => $becomes,
                'hours_minimum' => (int) $row['CADUCIDAD_MINIMA'],
                'hours_maximum' => (int) $row['CADUCIDAD_MAXIMA'],
                'quantity' => (float) $row['CANTIDAD'],
                'message_type_slug' => $this->messageSlug($row['MENSAJE_TIPOID']),
                'replaces' => $row['SUSTITUIR'] === '1',
            ];
        }

        return $rows;
    }

    /** @return list<array<string, mixed>> */
    private function recipes(): array
    {
        $rows = [];

        foreach ($this->reader->rows('_ESCANDALLO') as $row) {
            $output = $this->resourceSlug($row['RECURSOID'], 'recipes');
            $input = $this->resourceSlug($row['RECURSO2ID'], 'recipes');
            $activity = LegacyMap::ACTIVITIES[$row['ACTIVIDADID']][0] ?? null;

            if ($output === null || $input === null || $activity === null) {
                $this->warn("Recipe {$row['RECURSOID']}/{$row['ACTIVIDADID']}/{$row['RECURSO2ID']} could not be mapped and was skipped.");

                continue;
            }

            $rows[] = [
                'output_resource_slug' => $output,
                'activity_slug' => $activity,
                'input_resource_slug' => $input,
                'need_minimum' => (float) $row['NECESIDAD_MINIMA'],
                'need_maximum' => (float) $row['NECESIDAD_MAXIMA'],
            ];
        }

        return $rows;
    }

    /** @return list<array<string, mixed>> */
    private function messageTypes(): array
    {
        $rows = [];

        foreach ($this->reader->rows('_MENSAJE_TIPO') as $row) {
            $code = (string) $row['MENSAJE_TIPOID'];

            if (! isset(LegacyMap::MESSAGE_TYPES[$code])) {
                $this->warn("Message type '{$code}' has no mapping and was skipped.");

                continue;
            }

            [$slug, $title, $text] = LegacyMap::MESSAGE_TYPES[$code];

            $rows[] = [
                'slug' => $slug,
                'legacy_code' => $code,
                'title' => $title,
                'text' => $text,
                'original_lifetime_hours' => (int) $row['DURACION'],
                'sends_email' => $row['EMAIL'] === '1',
            ];
        }

        return $rows;
    }

    /** @return list<array<string, mixed>> */
    private function activitySteps(): array
    {
        $rows = [];

        foreach ($this->reader->rows('_PROCESO_ACTIVIDAD') as $row) {
            $activityCode = (string) $row['ACTIVIDADID'];
            $activity = null;

            if ($activityCode !== '') {
                $activity = LegacyMap::ACTIVITIES[$activityCode][0] ?? null;

                if ($activity === null) {
                    $this->warn("Rule step for unknown activity '{$activityCode}' was skipped.");

                    continue;
                }
            }

            $rows[] = [
                'activity_slug' => $activity, // null = applies to every monk in every slot
                'position' => (int) $row['ORDEN'],
                'type' => (string) $row['TIPO'],
                'calculation' => $this->blank($row['CALCULO']) ? null : (string) $row['CALCULO'],
                'building_type_slug' => $this->blank($row['TIPOEDIFICIOID']) ? null : $this->buildingSlug((string) $row['TIPOEDIFICIOID'], "rule step {$activityCode}/{$row['ORDEN']}"),
                'trait_slug' => $this->blank($row['CARACTERISTICAID']) ? null : $this->traitSlug((string) $row['CARACTERISTICAID']),
                'resource_slug' => $this->blank($row['RECURSOID']) ? null : $this->resourceSlug($row['RECURSOID'], "rule step {$activityCode}/{$row['ORDEN']}"),
                'parameter1' => $this->floatOrNull($row['PARAMETRO1']),
                'parameter2' => $this->floatOrNull($row['PARAMETRO2']),
                'message_type_slug' => $this->messageSlug($row['MENSAJE_TIPOID']),
                'is_global_message' => $row['MENSAJE_GLOBAL'] === '1',
            ];
        }

        return $rows;
    }

    /** @return list<array<string, mixed>> */
    private function eventTypes(): array
    {
        $rows = [];

        foreach ($this->reader->rows('_EVENTO_TIPO') as $row) {
            $code = (string) $row['EVENTO_TIPOID'];

            if (! isset(LegacyMap::EVENT_TYPES[$code])) {
                $this->warn("Event type '{$code}' has no mapping and was skipped.");

                continue;
            }

            [$slug, $name, $scope] = LegacyMap::EVENT_TYPES[$code];

            $rows[] = [
                'slug' => $slug,
                'legacy_code' => $code,
                'name' => $name,
                'scope' => $scope,
                // The original period; the design retunes all events to about once per round.
                'period_hours' => (int) $row['PERIODICIDAD'],
                'is_original' => true,
            ];
        }

        return $rows;
    }

    /** @return list<array<string, mixed>> */
    private function eventChoices(): array
    {
        $rows = [];

        foreach ($this->reader->rows('_EVENTO_DECISION') as $row) {
            $event = LegacyMap::EVENT_TYPES[$row['EVENTO_TIPOID']][0] ?? null;

            if ($event === null) {
                continue;
            }

            $rows[] = [
                'event_type_slug' => $event,
                'position' => (int) $row['ORDEN'],
                'action' => $row['ACCION'] === 'don' ? 'donate_gold' : (string) $row['ACCION'],
                'amount' => (float) $row['CANTIDAD'],
            ];
        }

        return $rows;
    }

    /** @return list<array<string, mixed>> */
    private function names(): array
    {
        $rows = [];
        $seen = [];
        $damaged = 0;

        foreach ($this->reader->rows('_NOMBRE') as $row) {
            $kind = match ($row['TIPO']) {
                'A' => 'surname',
                'N', 'n' => 'male_first',
                default => null,
            };

            $name = trim((string) $row['NOMBRE']);

            if ($kind === null || $name === '') {
                continue;
            }

            if (str_contains($name, "\u{FFFD}")) {
                // Shown to players, so a broken name is worse than a missing one.
                $damaged++;

                continue;
            }

            $key = $kind.'|'.mb_strtolower($name);

            if (isset($seen[$key])) {
                continue;
            }

            $seen[$key] = true;
            $rows[] = ['kind' => $kind, 'origin' => 'everywhere', 'name' => $name, 'source' => self::SOURCE];
        }

        if ($damaged > 0) {
            $this->warn("{$damaged} names lost their accents before this dump was made (e.g. \"Jes\u{FFFD}s\") and were skipped. Import the original Latin-1 dump to include them.");
        }

        return $rows;
    }

    // ------------------------------------------------------------------
    // Translations (original texts in es, ca and en, for reference)
    // ------------------------------------------------------------------

    /** @return list<array<string, mixed>> */
    private function translations(): array
    {
        $specs = [
            // [legacy table, id column, field => legacy column, target table, slug resolver]
            ['_EDIFICIO_TIPOT', 'TIPOEDIFICIOID', ['name' => 'DESCRIPCION'], 'building_types', fn ($c) => LegacyMap::BUILDING_TYPES[$c][0] ?? null],
            ['_ACTIVIDADT', 'ACTIVIDADID', ['name' => 'DESCRIPCION', 'description' => 'COMENTARIOS'], 'activities', fn ($c) => LegacyMap::ACTIVITIES[$c][0] ?? null],
            ['_CARACTERISTICAT', 'CARACTERISTICAID', ['name' => 'DESCRIPCION'], 'traits', fn ($c) => LegacyMap::TRAITS[$c][0] ?? null],
            ['_RECURSO_TIPOT', 'RECURSOID', ['name' => 'NOMBRE'], 'resource_types', fn ($c) => LegacyMap::RESOURCES[$c][0] ?? null],
            ['_UNIDAD_MEDIDAT', 'UNIDADID', ['name' => 'NOMBRE', 'abbreviation' => 'ABREVIACION'], 'units', fn ($c) => LegacyMap::UNITS[$c][0] ?? null],
            ['_ESTADOT', 'ESTADOID', ['name' => 'NOMBRE'], 'field_states', fn ($c) => LegacyMap::FIELD_STATES[$c][0] ?? null],
            ['_CLANT', 'CLANID', ['name' => 'NOMBRE', 'history' => 'HISTORIA'], 'orders', fn ($c) => LegacyMap::ORDERS[$c][0] ?? null],
            ['_REGIONT', 'REGIONID', ['name' => 'NOMBRE', 'today' => 'ACTUALMENTE'], 'regions', fn ($c) => LegacyMap::REGIONS[$c][0] ?? null],
            ['_MENSAJE_TIPOT', 'MENSAJE_TIPOID', ['title' => 'GENERAL', 'text' => 'TEXTO', 'email' => 'EMAIL'], 'message_types', fn ($c) => LegacyMap::MESSAGE_TYPES[$c][0] ?? null],
            ['_UNIDAD_TIPOT', 'UNIDAD_TIPOID', ['name' => 'NOMBRE', 'objectives' => 'OBJETIVOS'], 'legacy_ranks', fn ($c) => $c],
            ['_PERIODOT', 'PERIODOID', ['name' => 'DESCRIPCION'], 'legacy_periods', fn ($c) => $c],
            ['_UTILIDADT', 'UTILIDADID', ['description' => 'DESCRIPCION'], 'legacy_building_features', fn ($c) => $c],
            ['_EVENTO_TIPOT', 'EVENTO_TIPOID', ['description' => 'DESCRIPCION'], 'event_types', fn ($c) => LegacyMap::EVENT_TYPES[$c][0] ?? null],
            ['_PAGINAT', 'TEXTOID', ['text' => 'TEXTO'], 'ui_strings', fn ($c) => $c],
        ];

        $rows = [];

        foreach ($specs as [$table, $idColumn, $fields, $target, $resolve]) {
            foreach ($this->reader->rows($table) as $row) {
                $slug = $resolve((string) $row[$idColumn]);

                if ($slug === null || $slug === '') {
                    continue;
                }

                foreach ($fields as $field => $column) {
                    $value = $this->cleanText($row[$column] ?? null);

                    if ($value === null) {
                        continue;
                    }

                    $rows[] = [
                        'translatable_type' => $target,
                        'translatable_key' => (string) $slug,
                        'locale' => (string) $row['IDIOMAID'],
                        'field' => $field,
                        'value' => $value,
                        'source' => self::SOURCE,
                    ];
                }
            }
        }

        // Later rows win for duplicate keys, as a database upsert would.
        $unique = [];

        foreach ($rows as $row) {
            $unique[$row['translatable_type'].'|'.$row['translatable_key'].'|'.$row['locale'].'|'.$row['field']] = $row;
        }

        return array_values($unique);
    }

    // ------------------------------------------------------------------
    // Helpers
    // ------------------------------------------------------------------

    private function buildingSlug(string $code, string $context): ?string
    {
        if (isset(LegacyMap::BUILDING_TYPES[$code])) {
            return LegacyMap::BUILDING_TYPES[$code][0];
        }

        $this->warn("Unknown building code '{$code}' in {$context}; that row was skipped.");

        return null;
    }

    private function resourceSlug(?string $code, string $context): ?string
    {
        $code = (string) $code;

        if (isset(LegacyMap::RESOURCES[$code])) {
            return LegacyMap::RESOURCES[$code][0];
        }

        if (isset(LegacyMap::RESOURCE_ALIASES[$code])) {
            return LegacyMap::RESOURCE_ALIASES[$code];
        }

        $this->warn("Unknown resource code '{$code}' in {$context}; that row was skipped.");

        return null;
    }

    private function traitSlug(string $code): ?string
    {
        if (isset(LegacyMap::TRAITS[$code])) {
            return LegacyMap::TRAITS[$code][0];
        }

        $this->warn("Trait '{$code}' has no mapping and was skipped.");

        return null;
    }

    private function stateSlug(?string $code): ?string
    {
        if ($this->blank($code)) {
            return null;
        }

        if (isset(LegacyMap::FIELD_STATES[$code])) {
            return LegacyMap::FIELD_STATES[$code][0];
        }

        $this->warn("Unknown field state '{$code}'; left empty.");

        return null;
    }

    private function messageSlug(?string $code): ?string
    {
        if ($this->blank($code)) {
            return null;
        }

        if (isset(LegacyMap::MESSAGE_TYPES[$code])) {
            return LegacyMap::MESSAGE_TYPES[$code][0];
        }

        $this->warn("Message type '{$code}' is referenced but was never defined; left empty.");

        return null;
    }

    /** @return array<string, string> code => text for one language */
    private function texts(string $table, string $idColumn, string $column, string $locale): array
    {
        $texts = [];

        foreach ($this->reader->rows($table) as $row) {
            if ($row['IDIOMAID'] === $locale && ! $this->blank($row[$column] ?? null)) {
                $texts[(string) $row[$idColumn]] = (string) $row[$column];
            }
        }

        return $texts;
    }

    /** @return array<string, string|null>|null */
    private function find(string $table, string $column, string $value): ?array
    {
        foreach ($this->reader->rows($table) as $row) {
            if ($row[$column] === $value) {
                return $row;
            }
        }

        return null;
    }

    /**
     * Removes the "*=*" untranslated marker and HTML, keeping paragraph breaks.
     */
    private function cleanText(?string $text): ?string
    {
        if ($text === null) {
            return null;
        }

        $text = str_replace('*=*', '', $text);
        $text = preg_replace('#</p>\s*<p>|<br\s*/?>#i', "\n\n", $text) ?? $text;
        $text = html_entity_decode(strip_tags($text), ENT_QUOTES | ENT_HTML5, 'UTF-8');
        $text = trim(preg_replace("/[ \t]+/", ' ', $text) ?? $text);

        return $text === '' ? null : $text;
    }

    private function blank(?string $value): bool
    {
        return $value === null || trim($value) === '';
    }

    private function intOrNull(?string $value): ?int
    {
        return $this->blank($value) || (float) $value === 0.0 ? null : (int) $value;
    }

    private function floatOrNull(?string $value): ?float
    {
        return $this->blank($value) ? null : (float) $value;
    }

    private function warn(string $message): void
    {
        $this->warnings[] = $message;
    }
}
