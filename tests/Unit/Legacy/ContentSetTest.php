<?php

/*
 * The Religious Game (revival).
 * Based on "The Religious Game" by Enric Mogas Nonell, Jugando en .NET, 2004.
 * Licensed under the GNU Affero General Public License v3.0 or later. See LICENSE.
 */

declare(strict_types=1);

namespace Tests\Unit\Legacy;

use App\Content\ContentSet;
use App\Legacy\SqlDumpReader;
use PHPUnit\Framework\TestCase;

/**
 * Runs the importer's mapping on the recovered dump in database/legacy.
 */
class ContentSetTest extends TestCase
{
    private static ?ContentSet $set = null;

    private function set(): ContentSet
    {
        return self::$set ??= ContentSet::build(
            SqlDumpReader::fromFile(dirname(__DIR__, 3).'/database/legacy/religious_db.sql'),
        );
    }

    /** @return array<string, array<string, mixed>> */
    private function bySlug(string $table): array
    {
        return array_column($this->set()->rows($table), null, 'slug');
    }

    public function test_content_has_no_errors(): void
    {
        $this->assertSame([], $this->set()->errors());
    }

    public function test_expected_amounts_of_content(): void
    {
        $counts = $this->set()->counts();

        $this->assertSame(28, $counts['building_types']); // 25 original + forge, wine press, apiary
        $this->assertSame(132, $counts['resource_types']);
        $this->assertSame(38, $counts['activities']);
        $this->assertSame(17, $counts['traits']);
        $this->assertSame(4, $counts['orders']);
        $this->assertSame(5, $counts['regions']);
        $this->assertSame(60, $counts['region_climates']);
        $this->assertSame(9, $counts['periods']);
        $this->assertSame(11, $counts['offices']);
        $this->assertSame(121, $counts['activity_steps']);
        $this->assertGreaterThan(3500, $counts['names']);
    }

    public function test_buildings_use_english_slugs_and_design_build_times(): void
    {
        $buildings = $this->bySlug('building_types');

        $this->assertSame('bib', $buildings['library']['legacy_code']);
        $this->assertSame(90, $buildings['library']['build_days']);
        $this->assertSame(90, $buildings['walls']['build_days']);        // cut from 360 in the design
        $this->assertSame(360, $buildings['walls']['original_build_days']);
        $this->assertFalse($buildings['forge']['is_original']);
    }

    public function test_library_costs_match_the_design_document(): void
    {
        $costs = [];

        foreach ($this->set()->rows('building_costs') as $row) {
            if ($row['building_type_slug'] === 'library') {
                $costs[$row['resource_slug']] = $row['quantity'];
            }
        }

        ksort($costs);
        $this->assertSame(['gold' => 10000.0, 'iron' => 0.2, 'stone' => 10.0, 'wood' => 1.0], $costs);
    }

    public function test_english_names_are_cleaned_up(): void
    {
        $this->assertSame('Fell trees', $this->bySlug('activities')['fell_trees']['name']);         // was "Destroy Trees"
        $this->assertSame('Sewing room', $this->bySlug('building_types')['sewing_room']['name']);   // was "Seam factory"
        $this->assertSame('Double-headed axe', $this->bySlug('resource_types')['double_axe']['name']);
    }

    public function test_wine_from_the_cellars_points_to_the_new_wine_resource(): void
    {
        $storage = array_filter(
            $this->set()->rows('building_features'),
            fn (array $f): bool => $f['building_type_slug'] === 'cellars' && $f['kind'] === 'storage',
        );

        $this->assertContains('wine', array_column($storage, 'resource_slug'));
    }

    public function test_parents_come_before_children(): void
    {
        foreach (['resource_types', 'activities'] as $table) {
            $seen = [];

            foreach ($this->set()->rows($table) as $row) {
                if ($row['parent_slug'] ?? null) {
                    $this->assertArrayHasKey($row['parent_slug'], $seen, "{$table}: {$row['slug']} before its parent");
                }

                $seen[$row['slug']] = true;
            }
        }
    }

    public function test_original_texts_are_kept_as_reference_translations(): void
    {
        $library = array_filter(
            $this->set()->rows('translations'),
            fn (array $t): bool => $t['translatable_type'] === 'building_types' && $t['translatable_key'] === 'library',
        );

        $this->assertSame(['ca', 'en', 'es'], $this->sorted(array_column($library, 'locale')));
        $this->assertContains('Biblioteca', array_column($library, 'value'));
        $this->assertSame(['legacy_2007'], array_values(array_unique(array_column($library, 'source'))));
    }

    public function test_names_with_lost_accents_are_skipped(): void
    {
        foreach ($this->set()->rows('names') as $row) {
            $this->assertStringNotContainsString("\u{FFFD}", $row['name']);
        }
    }

    /** @param list<string> $values @return list<string> */
    private function sorted(array $values): array
    {
        $values = array_values(array_unique($values));
        sort($values);

        return $values;
    }
}
