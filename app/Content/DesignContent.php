<?php

/*
 * The Religious Game (revival).
 * Based on "The Religious Game" by Enric Mogas Nonell, Jugando en .NET, 2004.
 * Licensed under the GNU Affero General Public License v3.0 or later. See LICENSE.
 */

declare(strict_types=1);

namespace App\Content;

/**
 * Game content that the revival adds on top of the recovered 2005/2007 data,
 * taken from the design document ("The Religious Game — PHP 8 Revival
 * Design"). English is the source language.
 *
 * Every method returns plain arrays keyed by table name, so the same data
 * can be checked by plain-PHP tests and written by the Laravel importer.
 */
final class DesignContent
{
    /** @return array<string, list<array<string, mixed>>> */
    public static function tables(): array
    {
        return [
            'languages' => self::languages(),
            'orders' => self::orders(),
            'regions' => self::regions(),
            'region_climates' => self::regionClimates(),
            'periods' => self::periods(),
            'ranks' => self::ranks(),
            'offices' => self::offices(),
            'resource_types' => self::resourceTypes(),
            'activities' => self::activities(),
            'building_types' => self::buildingTypes(),
            'building_costs' => self::buildingCosts(),
            'building_features' => self::buildingFeatures(),
            'event_types' => self::eventTypes(),
            'parcel_types' => self::parcelTypes(),
            'names' => self::names(),
        ];
    }

    /** @return list<array<string, mixed>> */
    public static function languages(): array
    {
        return [
            ['code' => 'en', 'name' => 'English', 'native_name' => 'English', 'date_format' => 'j F Y', 'decimal_separator' => '.', 'thousands_separator' => ',', 'is_active' => true],
            ['code' => 'es', 'name' => 'Spanish', 'native_name' => 'Español', 'date_format' => 'j \d\e F \d\e Y', 'decimal_separator' => ',', 'thousands_separator' => '.', 'is_active' => false],
            ['code' => 'ca', 'name' => 'Catalan', 'native_name' => 'Català', 'date_format' => 'j F Y', 'decimal_separator' => ',', 'thousands_separator' => '.', 'is_active' => false],
        ];
    }

    /** @return list<array<string, mixed>> */
    public static function orders(): array
    {
        return [
            [
                'slug' => 'carthusians', 'legacy_code' => 'car', 'name' => 'Carthusians', 'founder' => 'St Bruno', 'founded_year' => 1084,
                'character' => 'Silence, solitude, contemplation',
                'strength' => '+25% faith from prayer and meditation; fatigue rises more slowly',
                'weakness' => '−25% prices when selling at the market',
                'is_original' => true,
            ],
            [
                'slug' => 'dominicans', 'legacy_code' => 'dom', 'name' => 'Dominicans', 'founder' => 'St Dominic', 'founded_year' => 1216,
                'character' => 'Preaching, study',
                'strength' => '+25% wisdom from reading and writing; faster novice training',
                'weakness' => '−25% farm yields',
                'is_original' => true,
            ],
            [
                'slug' => 'benedictines', 'legacy_code' => null, 'name' => 'Benedictines', 'founder' => 'St Benedict', 'founded_year' => 529,
                'character' => 'Ora et labora, hospitality',
                'strength' => 'Guest house earns gold from pilgrims; no penalties',
                'weakness' => 'No bonus above +10% anywhere',
                'is_original' => false,
            ],
            [
                'slug' => 'cistercians', 'legacy_code' => null, 'name' => 'Cistercians', 'founder' => 'Robert of Molesme, Alberic and Stephen Harding (Cîteaux)', 'founded_year' => 1098,
                'character' => 'Austerity, farming, mills',
                'strength' => '+25% field, mill and livestock yields',
                'weakness' => '−25% faith from Mass; cannot build the Guest house',
                'is_original' => false,
            ],
        ];
    }

    /** @return list<array<string, mixed>> */
    public static function regions(): array
    {
        return [
            ['slug' => 'navarra', 'legacy_code' => '1', 'name' => 'Navarra', 'population' => 500000, 'weather_station' => 'Pamplona (1991–2020)', 'has_coast' => false, 'feature' => 'Good orchards and livestock', 'is_original' => true],
            ['slug' => 'castilla_y_leon', 'legacy_code' => '2', 'name' => 'Kingdom of Castile and León', 'population' => 2000000, 'weather_station' => 'Valladolid (1991–2020)', 'has_coast' => false, 'feature' => 'Largest market; best cereals', 'is_original' => true],
            ['slug' => 'catalunya', 'legacy_code' => null, 'name' => 'Catalonia (County of Barcelona)', 'population' => null, 'weather_station' => 'Barcelona (1994–2020)', 'has_coast' => true, 'feature' => 'Fishing and sea trade', 'is_original' => false],
            ['slug' => 'aragon', 'legacy_code' => null, 'name' => 'Kingdom of Aragon', 'population' => null, 'weather_station' => 'Zaragoza (1991–2020)', 'has_coast' => false, 'feature' => 'Sheep and wool; weaker crops', 'is_original' => false],
            ['slug' => 'galicia', 'legacy_code' => null, 'name' => 'Kingdom of Galicia', 'population' => null, 'weather_station' => 'Santiago de Compostela (1981–2010)', 'has_coast' => true, 'feature' => 'On the Camino de Santiago: frequent pilgrims', 'is_original' => false],
        ];
    }

    /**
     * Monthly climate normals per region, from the design document
     * (AEMET station data via Wikipedia, opened 25 September 2026).
     *
     * @return list<array<string, mixed>>
     */
    public static function regionClimates(): array
    {
        $temperature = [
            'navarra' => [5.7, 6.5, 9.5, 11.5, 15.2, 19.1, 21.6, 22.1, 18.5, 14.5, 9.2, 6.1],
            'castilla_y_leon' => [4.4, 6.0, 9.1, 11.3, 15.2, 19.8, 22.7, 22.5, 18.5, 13.6, 8.0, 5.0],
            'catalunya' => [11.3, 11.3, 13.1, 15.1, 18.0, 21.9, 24.7, 25.2, 22.4, 19.1, 14.4, 11.9],
            'aragon' => [7.0, 8.5, 11.8, 14.4, 18.6, 23.1, 25.7, 25.6, 21.4, 16.6, 10.8, 7.2],
            'galicia' => [7.7, 8.3, 10.2, 11.2, 13.6, 16.8, 18.6, 19.0, 17.4, 13.8, 10.4, 8.5],
        ];

        $precipitation = [
            'navarra' => [74, 57, 66, 72, 61, 55, 34, 33, 46, 67, 86, 71],
            'castilla_y_leon' => [45, 24, 32, 49, 46, 27, 13, 12, 29, 61, 50, 45],
            'catalunya' => [33, 30, 38, 47, 31, 18, 25, 28, 65, 75, 38, 33],
            'aragon' => [24, 20, 28, 40, 40, 29, 17, 18, 27, 34, 34, 19],
            'galicia' => [210, 167, 146, 146, 135, 72, 43, 57, 107, 226, 217, 261],
        ];

        $rows = [];

        foreach ($temperature as $region => $months) {
            foreach ($months as $index => $mean) {
                $rows[] = [
                    'region_slug' => $region,
                    'month' => $index + 1,
                    'mean_temperature' => $mean,
                    'precipitation_mm' => $precipitation[$region][$index],
                ];
            }
        }

        return $rows;
    }

    /**
     * The 8 schedulable monastic hours (2 game hours each, 30 real minutes)
     * and the fixed night (8 game hours, 2 real hours).
     *
     * @return list<array<string, mixed>>
     */
    public static function periods(): array
    {
        $slots = [
            ['matins', 'Matins', 4], ['lauds', 'Lauds', 6], ['prime', 'Prime', 8], ['terce', 'Terce', 10],
            ['sext', 'Sext', 12], ['none', 'None', 14], ['vespers', 'Vespers', 16], ['compline', 'Compline', 18],
        ];

        $rows = [];

        foreach ($slots as $position => [$slug, $name, $start]) {
            $rows[] = ['slug' => $slug, 'name' => $name, 'position' => $position, 'starts_at_hour' => $start, 'length_hours' => 2, 'is_schedulable' => true];
        }

        $rows[] = ['slug' => 'night', 'name' => 'Night', 'position' => 8, 'starts_at_hour' => 20, 'length_hours' => 8, 'is_schedulable' => false];

        return $rows;
    }

    /** @return list<array<string, mixed>> */
    public static function ranks(): array
    {
        return [
            ['slug' => 'novice', 'name' => 'Novice', 'female_name' => 'Novice', 'position' => 1, 'legacy_code' => 'nov'],
            ['slug' => 'monk', 'name' => 'Monk', 'female_name' => 'Nun', 'position' => 2, 'legacy_code' => 'obe'],
        ];
    }

    /** @return list<array<string, mixed>> */
    public static function offices(): array
    {
        $offices = [
            ['abbot', 'Abbot', 'Abbess', 'Spiritual leadership, welfare, discipline, external relations', null, 'Elected', 'Community faith +10%; better outcomes with the bishop, nobles and the merchant'],
            ['prior', 'Prior', 'Prioress', 'Day-to-day running and discipline', null, 'Faith and wisdom', 'All work +5%; fills empty schedule slots with sensible defaults; acts as abbot during an election'],
            ['master_of_novices', 'Master of Novices', 'Mistress of Novices', 'Training new arrivals in the rule, prayers and vows', 'novitiate', 'Wisdom, charisma', 'Required to train novices; training speed scales with his traits'],
            ['cellarer', 'Cellarer', 'Cellaress', 'Food, drink, supplies and trade', null, 'Trade skill', 'Spoilage −25%; better prices at the stall, the merchant and on expeditions'],
            ['chamberlain', 'Chamberlain', 'Chamberlain', 'Clothing, bedding, hygiene', null, 'Dexterity', 'Habits wear out slower; illness chance −20% (with Washrooms and Sewing room)'],
            ['sacrist', 'Sacrist', 'Sacristan', 'Church, holy objects, vestments, liturgical books', 'church', 'Faith', 'Mass gives more faith; uses less wine and fewer candles; keeps the Church in good condition'],
            ['cantor', 'Cantor', 'Cantrix', 'Choir, chant, library and scriptorium', null, 'Wisdom, languages; Choir or Library', 'Faith from Mass and prayer +25%; books copied faster'],
            ['infirmarian', 'Infirmarian', 'Infirmarian', 'Infirmary; the sick, old and dying', 'infirmary', 'Wisdom', 'Healing twice as fast; epidemics spread less'],
            ['guest_master', 'Guest Master', 'Guest Mistress', 'Hospitality for travellers, pilgrims and visitors', 'guest_house', 'Charisma', 'More gold from pilgrims; more candidates at the door'],
            ['kitchener', 'Kitchener', 'Kitchener', 'Meals and the kitchen', 'kitchen', 'Dexterity', 'Cooking +25%; better rations; kitchen accidents less likely'],
            ['porter', 'Porter', 'Portress', 'The door, visitors and messages', null, 'Charisma', 'Better candidates at the door; event decisions wait longer; bandits and theft at home less likely'],
        ];

        return array_map(
            fn (array $o, int $i): array => [
                'slug' => $o[0], 'name' => $o[1], 'female_name' => $o[2], 'responsibility' => $o[3],
                'required_building_slug' => $o[4], 'requirements' => $o[5], 'effect' => $o[6], 'position' => $i + 1,
            ],
            $offices,
            array_keys($offices),
        );
    }

    /**
     * Resources the revival adds (wine, honey, mushrooms, ...).
     *
     * @return list<array<string, mixed>>
     */
    public static function resourceTypes(): array
    {
        $new = [
            // slug, name, parent, unit, shelf life (game hours, 0 = keeps)
            ['drinks', 'Drinks', null, 'litre', 0],
            ['grapes', 'Grapes', 'fruit', 'kilogram', 168],
            ['wine', 'Wine', 'drinks', 'litre', 0],
            ['aged_wine', 'Aged wine', 'drinks', 'litre', 0],
            ['honey', 'Honey', 'foodstuffs', 'kilogram', 0],
            ['beeswax', 'Beeswax', 'raw_materials', 'kilogram', 0],
            ['candles', 'Candles', 'crafts', 'unit', 0],
            ['mushrooms', 'Mushrooms', 'foodstuffs', 'kilogram', 72],
            ['dried_mushrooms', 'Dried mushrooms', 'foodstuffs', 'kilogram', 1440],
            ['truffles', 'Black truffles', 'foodstuffs', 'kilogram', 168],
            ['iron_ore', 'Iron ore', 'minerals', 'tonne', 0],
            ['salt', 'Salt', 'raw_materials', 'kilogram', 0],
            ['salted_meat', 'Salted meat', 'meat', 'kilogram', 720],
            ['smoked_meat', 'Smoked meat', 'meat', 'kilogram', 360],
            ['vines', 'Vines', 'plantable', 'unit', 0],
        ];

        return array_map(fn (array $r): array => [
            'slug' => $r[0], 'legacy_code' => null, 'name' => $r[1], 'parent_slug' => $r[2], 'unit_slug' => $r[3],
            'shelf_life_hours' => $r[4], 'is_original' => false,
        ], $new);
    }

    /** @return list<array<string, mixed>> */
    public static function activities(): array
    {
        $new = [
            ['smithing', 'Smithing', 'workshop'],
            ['harvest_grapes', 'Harvest grapes', 'land'],
            ['pressing', 'Press wine', 'workshop'],
            ['beekeeping', 'Keep bees', 'animals'],
            ['candle_making', 'Make candles', 'workshop'],
            ['gather_mushrooms', 'Gather mushrooms', 'wild'],
            ['drying', 'Dry food', 'workshop'],
            ['salting', 'Salt meat and fish', 'workshop'],
            ['smoking', 'Smoke meat and fish', 'workshop'],
        ];

        return array_map(fn (array $a): array => [
            'slug' => $a[0], 'legacy_code' => null, 'name' => $a[1], 'category' => $a[2], 'is_original' => false,
        ], $new);
    }

    /** @return list<array<string, mixed>> */
    public static function buildingTypes(): array
    {
        return [
            ['slug' => 'forge', 'legacy_code' => null, 'name' => 'Forge', 'build_days' => 30, 'is_original' => false],
            ['slug' => 'wine_press', 'legacy_code' => null, 'name' => 'Wine press', 'build_days' => 30, 'is_original' => false],
            ['slug' => 'apiary', 'legacy_code' => null, 'name' => 'Apiary', 'build_days' => 15, 'is_original' => false],
        ];
    }

    /** @return list<array<string, mixed>> */
    public static function buildingCosts(): array
    {
        $costs = [
            'forge' => ['gold' => 750, 'iron' => 1, 'wood' => 1, 'stone' => 5],
            'wine_press' => ['gold' => 500, 'iron' => 0.2, 'wood' => 1.5, 'stone' => 2],
            'apiary' => ['gold' => 250, 'wood' => 0.5],
        ];

        $rows = [];

        foreach ($costs as $building => $resources) {
            foreach ($resources as $resource => $quantity) {
                $rows[] = ['building_type_slug' => $building, 'resource_slug' => $resource, 'quantity' => $quantity];
            }
        }

        return $rows;
    }

    /** @return list<array<string, mixed>> */
    public static function buildingFeatures(): array
    {
        return [
            ['building_type_slug' => 'forge', 'kind' => 'activity_places', 'activity_slug' => 'smithing', 'resource_slug' => null, 'trait_slug' => null, 'amount' => 2, 'position' => 0],
            ['building_type_slug' => 'forge', 'kind' => 'storage', 'activity_slug' => null, 'resource_slug' => 'tools', 'trait_slug' => null, 'amount' => 50, 'position' => 1],
            ['building_type_slug' => 'wine_press', 'kind' => 'activity_places', 'activity_slug' => 'pressing', 'resource_slug' => null, 'trait_slug' => null, 'amount' => 3, 'position' => 0],
            ['building_type_slug' => 'apiary', 'kind' => 'activity_places', 'activity_slug' => 'beekeeping', 'resource_slug' => null, 'trait_slug' => null, 'amount' => 1, 'position' => 0],
            ['building_type_slug' => 'apiary', 'kind' => 'storage', 'activity_slug' => null, 'resource_slug' => 'honey', 'trait_slug' => null, 'amount' => 100, 'position' => 1],
        ];
    }

    /** @return list<array<string, mixed>> */
    public static function eventTypes(): array
    {
        $new = [
            ['bishops_visit', 'Bishop\'s visit', 'monastery'],
            ['wolves', 'Wolves', 'monastery'],
            ['bandits', 'Bandits', 'expedition'],
            ['drought', 'Drought', 'region'],
            ['nobles_bequest', 'Noble\'s bequest', 'monastery'],
            ['epidemic', 'Epidemic', 'region'],
        ];

        return array_map(fn (array $e): array => [
            'slug' => $e[0], 'legacy_code' => null, 'name' => $e[1], 'scope' => $e[2], 'period_hours' => null, 'is_original' => false,
        ], $new);
    }

    /** @return list<array<string, mixed>> */
    public static function parcelTypes(): array
    {
        return [
            ['slug' => 'field', 'name' => 'Field', 'used_for' => 'Plough, sow and harvest (worked from the Vegetable garden)'],
            ['slug' => 'orchard', 'name' => 'Orchard', 'used_for' => 'Fruit trees: plant once, harvest each season'],
            ['slug' => 'vineyard', 'name' => 'Vineyard', 'used_for' => 'Vines: plant once, harvest grapes in September–October'],
            ['slug' => 'pasture', 'name' => 'Pasture', 'used_for' => 'Room for livestock; more pasture means more animals'],
            ['slug' => 'forest', 'name' => 'Forest', 'used_for' => 'Felling wood, hunting and gathering mushrooms; recovers slowly if over-used'],
            ['slug' => 'water', 'name' => 'River or coast', 'used_for' => 'Fishing; coast only in Catalonia and Galicia'],
            ['slug' => 'hillside', 'name' => 'Hillside', 'used_for' => 'Stone; iron ore in Aragon'],
        ];
    }

    /**
     * Name pools from the design document. The original's 3,396 surnames and
     * 11 first names are imported from the legacy data separately.
     *
     * @return list<array<string, mixed>>
     */
    public static function names(): array
    {
        $pools = [
            // kind, origin, names
            ['female_first', 'castilla_y_leon', 'Urraca, Elvira, Teresa, Mayor, Jimena, Berenguela, Leonor, Constanza, Aldonza, Mencía, Estefanía, Casilda'],
            ['male_first', 'castilla_y_leon', 'Rodrigo, Fernando, Alfonso, Gonzalo, Diego, Gutierre, Pelayo, Munio'],
            ['female_first', 'navarra', 'Sancha, Toda, Oria, Urraca, Mayor'],
            ['male_first', 'navarra', 'Íñigo, Jimeno, Fortún, Sancho, García, Lope'],
            ['female_first', 'aragon', 'Sancha, Toda, Teresa, Oria'],
            ['male_first', 'aragon', 'Jimeno, Blasco, Lope, Fortún, Pedro'],
            ['female_first', 'catalunya', 'Ermessenda, Elisenda, Guillerma, Brunissenda, Eulàlia'],
            ['male_first', 'catalunya', 'Ramon, Berenguer, Guillem, Arnau, Bernat, Pere, Jaume'],
            ['female_first', 'galicia', 'Aldara, Urraca, Teresa, Mayor, Senhorinha'],
            ['male_first', 'galicia', 'Paio, Afonso, Vasco, Nuno, Rodrigo'],
            ['female_first', 'everywhere', 'María, Inés, Marina, Juliana, Lucía, Águeda, Gracia, Plácida, Hilaria'],
            ['male_first', 'everywhere', 'Pedro, Martín, Juan, Domingo, Esteban'],
            ['female_first', 'england', 'Matilda, Alice, Agnes, Isabel, Emma, Edith, Cecily, Margery, Christina, Hawise, Avice, Beatrice, Eleanor, Clemence, Leofrun, Euphemia'],
            ['male_first', 'england', 'William, Robert, Richard, Walter, Hugh, Roger, Ralph, Geoffrey, Gilbert, Simon, Osbert, Godric, Wulfstan, Adam, Reginald, Alan, Alexander, Fulk, Gervase, Henry, Jocelyn, Lawrence, Matthew, Osbern, Symeon, Tancred, Warner, Aelric, Bartholomew, Benet, Clement, Dominic, Eilmer, Goscelin, Haymo, Hervey, Lucian, Orderic, Peter, Samson, Walcher'],
            ['female_first', 'france', 'Adela, Ermengarde, Guillemette, Isabeau, Alix, Blanche, Héloïse, Humbeline, Adélaïde, Béatrix'],
            ['male_first', 'france', 'Guillaume, Gautier, Hugues, Raoul, Aimery, Bertrand'],
            ['female_religious', 'everywhere', 'Mary, Anne, Agnes, Agatha, Barbara, Brigid, Catherine, Cecilia, Esther, Eulalia, Gertrude, Irene, Joan, Judith, Justa, Leocadia, Lucy, Margaret, Martha, Rufina, Scholastica, Susanna, Casilda, Senhorinha, Thecla, Cunigunde, Opportuna, Wiborada, Aldegund, Amalberga, Humbeline, Hildegard'],
            ['male_religious', 'everywhere', 'Andrew, Anselm, Augustine, Benedict, Bernard, Bruno, David, Emilian, Fructuosus, Gabriel, Gregory, Isidore, James, Jerome, John, Lawrence, Leander, Martin, Michael, Paul, Peter, Raphael, Stephen, Thomas, Vincent'],
            ['female_religious', 'england', 'Hilda, Etheldreda, Frideswide, Mildred, Edith, Tova, Wynthryth, Pudentiana'],
            ['male_religious', 'england', 'Bede, Cuthbert, Dunstan, Aldhelm, Wilfrid, Edmund, Edward, Aelred, Eadberht, Eadfrith, Eata, Aldhun, Egwin, Germanus, Hugh'],
            ['place', 'england', 'Canterbury, Durham, Worcester, Hexham, Malmesbury, Lindisfarne, Tewkesbury, Coldingham, Huntingdon, Wendover, Devizes, Thorney, Wallingford, Walsingham, Lynn, Lincoln, Norwich, York, Evesham, St Albans, Farne, Bury, Llanthony, Malvern, Faversham, Ashby, Chester, Reading, Barking, Ramsey, Winchester, Gloucester, Dover, Bridlington'],
        ];

        $rows = [];

        foreach ($pools as [$kind, $origin, $list]) {
            foreach (array_map('trim', explode(',', $list)) as $name) {
                $rows[] = ['kind' => $kind, 'origin' => $origin, 'name' => $name, 'source' => 'design'];
            }
        }

        return $rows;
    }
}
