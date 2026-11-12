<?php

/*
 * The Religious Game (revival).
 * Based on "The Religious Game" by Enric Mogas Nonell, Jugando en .NET, 2004.
 * Licensed under the GNU Affero General Public License v3.0 or later. See LICENSE.
 */

declare(strict_types=1);

namespace App\Legacy;

/**
 * Maps the original game's 3-letter codes to the revival's English slugs and
 * cleaned-up English names.
 *
 * The 2007 database has English text, but much of it was machine translated
 * ("Destroy Trees", "Seam factory"). English is the revival's source
 * language, so the names here are rewritten by hand. The original English,
 * Spanish and Catalan texts are still imported as translation rows marked
 * "legacy_2007", for reference.
 */
final class LegacyMap
{
    /** @var array<string, array{0: string, 1: string}> code => [slug, English name] */
    public const BUILDING_TYPES = [
        'alm' => ['store', 'Store'],
        'auc' => ['chapter_house', 'Chapter house'],
        'bib' => ['library', 'Library'],
        'cal' => ['warming_room', 'Warming room'],
        'cla' => ['cloister', 'Cloister'],
        'coc' => ['kitchen', 'Kitchen'],
        'cor' => ['choir', 'Choir'],
        'cua' => ['stable', 'Stable'],
        'dor' => ['dormitory', 'Dormitory'],
        'enf' => ['infirmary', 'Infirmary'],
        'esc' => ['school', 'School'],
        'gra' => ['farm', 'Farm'],
        'grn' => ['granary', 'Granary'],
        'hos' => ['guest_house', 'Guest house'],
        'hue' => ['vegetable_garden', 'Vegetable garden'],
        'igl' => ['church', 'Church'],
        'lav' => ['washrooms', 'Washrooms'],
        'mol' => ['mill', 'Mill'],
        'mur' => ['walls', 'Walls'],
        'nov' => ['novitiate', 'Novitiate'],
        'ora' => ['oratory', 'Oratory'],
        'ref' => ['refectory', 'Refectory'],
        'sot' => ['cellars', 'Cellars'],
        'tar' => ['craft_workshop', 'Craft workshop'],
        'tco' => ['sewing_room', 'Sewing room'],
    ];

    /**
     * Build times decided in the design document that differ from the
     * original (in game days).
     *
     * @var array<string, int>
     */
    public const BUILD_DAYS_OVERRIDES = [
        'walls' => 90,
    ];

    /** @var array<string, array{0: string, 1: string, 2: string}> code => [slug, English name, group] */
    public const ACTIVITIES = [
        'rez' => ['pray', 'Pray', 'spiritual'],
        'med' => ['meditate', 'Meditate', 'spiritual'],
        'mis' => ['celebrate_mass', 'Celebrate Mass', 'spiritual'],
        'lee' => ['read', 'Read', 'spiritual'],
        'esc' => ['write', 'Copy books', 'spiritual'],
        'cul' => ['cultivate', 'Cultivate', 'land'],
        'ara' => ['plough', 'Plough', 'land'],
        'sem' => ['sow', 'Sow', 'land'],
        'dpl' => ['plant_trees', 'Plant trees', 'land'],
        'cos' => ['harvest', 'Harvest', 'land'],
        'gan' => ['raise_livestock', 'Raise livestock', 'animals'],
        'ord' => ['milk', 'Milk', 'animals'],
        'cas' => ['castrate', 'Castrate', 'animals'],
        'sac' => ['slaughter', 'Slaughter', 'animals'],
        'caz' => ['hunt', 'Hunt', 'wild'],
        'pes' => ['fish', 'Fish', 'wild'],
        'cle' => ['fell_trees', 'Fell trees', 'wild'],
        'emi' => ['mine', 'Mine ore', 'wild'],
        'mol' => ['mill_grain', 'Mill grain', 'workshop'],
        'hor' => ['bake', 'Bake', 'workshop'],
        'coc' => ['cook', 'Cook', 'workshop'],
        'fqu' => ['make_cheese', 'Make cheese', 'workshop'],
        'con' => ['sew', 'Sew clothing', 'workshop'],
        'art' => ['make_crafts', 'Make crafts', 'workshop'],
        'san' => ['heal', 'Heal', 'care'],
        'fno' => ['train_novices', 'Train novices', 'care'],
        'com' => ['eat', 'Eat', 'body'],
        'des' => ['rest', 'Rest', 'body'],
        'dor' => ['sleep', 'Sleep', 'body'],
    ];

    /** @var array<string, array{0: string, 1: string}> */
    public const TRAITS = [
        'fe' => ['faith', 'Faith'],
        'sap' => ['wisdom', 'Wisdom'],
        'car' => ['charisma', 'Charisma'],
        'des' => ['dexterity', 'Dexterity'],
        'com' => ['trade', 'Trade'],
        'idi' => ['languages', 'Languages'],
        'tal' => ['talent', 'Talent'],
        'hab' => ['ability', 'Ability'],
        'fue' => ['strength', 'Strength'],
        'sal' => ['health', 'Health'],
        'can' => ['fatigue', 'Fatigue'],
        'vit' => ['vitality', 'Vitality'],
        'nov' => ['novice_training', 'Novice training'],
        'man' => ['training_maximum', 'Training (maximum)'],
        'men' => ['training_average', 'Training (average)'],
        'min' => ['training_minimum', 'Training (minimum)'],
        'rac' => ['rations', 'Rations to prepare'],
    ];

    /** @var array<string, array{0: string, 1: string, 2: string}> code => [slug, name, abbreviation] */
    public const UNITS = [
        'doc' => ['dozen', 'Dozens', 'doz.'],
        'eje' => ['head', 'Head / copies', 'pcs'],
        'kgs' => ['kilogram', 'Kilograms', 'kg'],
        'l' => ['litre', 'Litres', 'l'],
        'm' => ['metre', 'Metres', 'm'],
        'm2' => ['square_metre', 'Square metres', 'm²'],
        'mon' => ['coin', 'Coins', 'coins'],
        'pre' => ['garment', 'Garments', 'pcs'],
        'rac' => ['ration', 'Rations', 'rations'],
        'sac' => ['sack', 'Sacks', 'sacks'],
        'ton' => ['tonne', 'Tonnes', 't'],
        'uni' => ['unit', 'Units', 'pcs'],
    ];

    /**
     * Resource codes. Codes without a name in any language (acr, cc2, cct and
     * the empty code) are left out on purpose; nothing refers to them.
     *
     * @var array<string, array{0: string, 1: string}>
     */
    public const RESOURCES = [
        // Categories (the original uses resources as tree nodes)
        'ang' => ['farm_animals', 'Farm animals'],
        'arb' => ['trees', 'Trees'],
        'car' => ['meat', 'Meat'],
        'cas' => ['game_meat', 'Game meat'],
        'cer' => ['cereals', 'Cereals'],
        'cmt' => ['foodstuffs', 'Foodstuffs'],
        'com' => ['meals', 'Meals'],
        'din' => ['money', 'Money'],
        'fru' => ['fruit', 'Fruit'],
        'her' => ['tools', 'Tools'],
        'hrn' => ['flours', 'Flours'],
        'hue' => ['eggs', 'Eggs'],
        'lec' => ['milk', 'Milk'],
        'leg' => ['legumes', 'Legumes'],
        'lib' => ['books', 'Books'],
        'mar' => ['seafood', 'Seafood'],
        'min' => ['minerals', 'Minerals'],
        'nat' => ['raw_materials', 'Raw materials'],
        'oar' => ['crafts', 'Crafts'],
        'ord' => ['milkable_animals', 'Milkable animals'],
        'pan' => ['bread', 'Bread'],
        'pla' => ['plantable', 'Plantable'],
        'pls' => ['hides', 'Hides'],
        'que' => ['cheeses', 'Cheeses'],
        'rel' => ['relics', 'Relics'],
        'rop' => ['clothing', 'Clothing'],
        'sem' => ['seeds', 'Seeds'],
        'ver' => ['vegetables', 'Vegetables'],
        // Farm animals
        'abr' => ['goat', 'Goat'],
        'abu' => ['ox', 'Ox'],
        'aca' => ['horse', 'Horse'],
        'ace' => ['pig', 'Pig'],
        'agh' => ['hen', 'Hen'],
        'agm' => ['rooster', 'Rooster'],
        'atm' => ['calf', 'Calf'],
        'ato' => ['bull', 'Bull'],
        'ava' => ['cow', 'Cow'],
        'aye' => ['mare', 'Mare'],
        // Meat
        'cbr' => ['goat_meat', 'Goat meat'],
        'cce' => ['pork', 'Pork'],
        'cco' => ['rabbit_meat', 'Rabbit meat'],
        'ccr' => ['lamb', 'Lamb'],
        'cov' => ['mutton', 'Mutton'],
        'cpl' => ['chicken_meat', 'Chicken'],
        'cto' => ['bull_meat', 'Bull meat'],
        'ctr' => ['veal', 'Veal'],
        'cvc' => ['beef', 'Beef'],
        'cja' => ['boar_meat', 'Wild boar meat'],
        'cli' => ['hare_meat', 'Hare meat'],
        'cpe' => ['partridge_meat', 'Partridge meat'],
        'cre' => ['reindeer_meat', 'Reindeer meat'],
        // Cereals, flour, bread
        'cav' => ['oats', 'Oats'],
        'caz' => ['rice', 'Rice'],
        'ccb' => ['barley', 'Barley'],
        'ccn' => ['rye', 'Rye'],
        'cse' => ['sesame', 'Sesame'],
        'ctg' => ['wheat', 'Wheat'],
        'hcn' => ['rye_flour', 'Rye flour'],
        'htr' => ['wheat_flour', 'Wheat flour'],
        'pbl' => ['white_bread', 'White bread'],
        // Meals
        'cpr' => ['prepared_food', 'Prepared food'],
        'm01' => ['chicken_with_vegetables', 'Chicken with vegetables'],
        'm02' => ['reindeer_stew', 'Reindeer stew'],
        'm03' => ['hare_with_vegetables', 'Hare with vegetables'],
        'm04' => ['roast_partridges', 'Roast partridges'],
        'm05' => ['roast_boar', 'Roast wild boar'],
        'm06' => ['fish_and_seafood', 'Fish and seafood'],
        'm07' => ['omelette', 'Omelette'],
        // Fruit, legumes, vegetables
        'fhi' => ['figs', 'Figs'],
        'fma' => ['apples', 'Apples'],
        'fna' => ['oranges', 'Oranges'],
        'fsa' => ['watermelons', 'Watermelons'],
        'lga' => ['chickpeas', 'Chickpeas'],
        'lju' => ['beans', 'Beans'],
        'lle' => ['lentils', 'Lentils'],
        'vcb' => ['marrows', 'Marrows'],
        // Seeds
        'sar' => ['rice_seed', 'Rice seed'],
        'sav' => ['oat_seed', 'Oat seed'],
        'scb' => ['marrow_seed', 'Marrow seed'],
        'sce' => ['barley_seed', 'Barley seed'],
        'scn' => ['rye_seed', 'Rye seed'],
        'shi' => ['fig_seed', 'Fig seed'],
        'sma' => ['apple_seed', 'Apple seed'],
        'sna' => ['orange_seed', 'Orange seed'],
        'ssa' => ['watermelon_seed', 'Watermelon seed'],
        // Milk, eggs, cheese
        'lca' => ['goat_milk', 'Goat milk'],
        'lov' => ['sheep_milk', 'Sheep milk'],
        'lva' => ['cow_milk', 'Cow milk'],
        'hug' => ['hen_eggs', 'Hen eggs'],
        'qca' => ['goat_cheese', 'Goat cheese'],
        'qov' => ['sheep_cheese', 'Sheep cheese'],
        'qva' => ['cow_cheese', 'Cow cheese'],
        // Seafood
        'pes' => ['fish', 'Fish'],
        'mrc' => ['shellfish', 'Shellfish'],
        // Raw materials and minerals
        'mad' => ['wood', 'Wood'],
        'pie' => ['stone', 'Stone'],
        'hie' => ['iron', 'Iron'],
        'nla' => ['wool', 'Wool'],
        'cua' => ['rennet', 'Rennet'],
        // Tools
        'har' => ['plough_tool', 'Plough'],
        'haz' => ['hoe', 'Hoe'],
        'hha' => ['axe', 'Axe'],
        'hhd' => ['double_axe', 'Double-headed axe'],
        'hpi' => ['pick', 'Pick'],
        'arc' => ['hunting_bow', 'Hunting bow'],
        'fle' => ['arrows', 'Arrows'],
        'hco' => ['harness', 'Harness'],
        'hte' => ['loom', 'Loom'],
        // Clothing and hides
        'hab' => ['habit', 'Habits'],
        'pre' => ['reindeer_hide', 'Reindeer hide'],
        'pva' => ['cowhide', 'Cowhide'],
        // Crafts
        'alf' => ['pottery', 'Pottery'],
        'cru' => ['crucifixes', 'Crucifixes'],
        'vas' => ['vessels', 'Vessels'],
        // Relics and money
        'r01' => ['chalice', 'Chalice'],
        'r02' => ['altar', 'Altar'],
        'oro' => ['gold', 'Gold'],
    ];

    /**
     * Codes that the original refers to but never defined. They point to
     * resources that the revival's design content adds.
     *
     * @var array<string, string>
     */
    public const RESOURCE_ALIASES = [
        'vin' => 'wine',
    ];

    /** @var array<string, array{0: string, 1: string}> */
    public const FIELD_STATES = [
        'bru' => ['unworked', 'Unworked'],
        'ara' => ['ploughed', 'Ploughed'],
        'sem' => ['sown', 'Sown'],
        'cos' => ['harvestable', 'Ready to harvest'],
        'pla' => ['planted', 'Planted'],
        'fru' => ['fruiting', 'Bearing fruit'],
        'mad' => ['overripe', 'Overripe'],
        'alm' => ['stored', 'Stored'],
    ];

    /** @var array<string, array{0: string, 1: string}> */
    public const ORDERS = [
        'car' => ['carthusians', 'Carthusians'],
        'dom' => ['dominicans', 'Dominicans'],
    ];

    /** @var array<string, array{0: string, 1: string}> */
    public const REGIONS = [
        '1' => ['navarra', 'Navarra'],
        '2' => ['castilla_y_leon', 'Kingdom of Castile and León'],
    ];

    /** @var array<string, array{0: string, 1: string, 2: string}> code => [slug, name, scope] */
    public const EVENT_TYPES = [
        'terrem' => ['earthquake', 'Earthquake', 'region'],
        'incedi' => ['fire', 'Fire', 'building'],
        'accoci' => ['kitchen_accident', 'Kitchen accident', 'building'],
        'peregr' => ['pilgrim', 'Pilgrim at the gate', 'monastery'],
        'homenf' => ['monk_falls_ill', 'Monk falls ill', 'monk'],
        'cosmal' => ['bad_harvest', 'Bad harvest', 'region'],
    ];

    /**
     * Message types with rewritten English. Placeholders are :p1 .. :p4
     * (the original used &1 .. &4).
     *
     * @var array<string, array{0: string, 1: string, 2: string}> code => [slug, title, text]
     */
    public const MESSAGE_TYPES = [
        'comefe' => ['purchase_completed', 'Purchase completed', 'Your purchase of :p1 :p2 of :p3 is complete.'],
        'conedi' => ['building_finished', 'Building finished', 'Your :p1 is finished.'],
        'crehom' => ['new_monk', 'New monk', ':p1 has joined your community.'],
        'crequi' => ['welcome', 'Welcome', 'You are now the abbot of :p1.'],
        'faledi' => ['missing_building', 'No place to work', ':p1 could not :p2: there is no :p3, or it is full.'],
        'falrec' => ['missing_resources', 'Missing supplies', ':p1 could not :p2 for lack of :p3.'],
        'fataco' => ['activity_failed', 'Work not done', ':p1 could not finish :p2.'],
        'homfal' => ['monk_died', 'A death in the community', 'Your monastery is in mourning. :p1 has died. May he rest in peace.'],
        'merbor' => ['listing_withdrawn', 'Listing withdrawn', 'You have withdrawn a listing from your stall.'],
        'mercom' => ['buy_order_placed', 'Order placed', 'You have ordered :p1 :p2 of :p3.'],
        'merven' => ['listing_placed', 'Listed for sale', 'You have listed :p1 :p2 of :p3 for sale.'],
        'novfor' => ['novice_trained', 'Novice trained', 'Novice :p1 has completed his training.'],
        'recbau' => ['animal_named', 'Animal named', 'You have named your :p1 :p2.'],
        'reccad' => ['goods_spoiled', 'Goods spoiled', ':p1 :p2 of :p3 have spoiled.'],
        'recdon' => ['goods_donated', 'Donation made', 'You have donated :p1 :p2 of :p3.'],
        'recgen' => ['goods_produced', 'Goods produced', ':p1 has produced :p2 :p3 of :p4.'],
        'subbor' => ['auction_unsold', 'Auction ended unsold', 'Your auction of :p1 :p2 ended without a buyer.'],
        'subcom' => ['auction_won', 'Auction won', 'You have won :p1 :p2 at auction for :p3.'],
        'subeje' => ['auction_sold', 'Auction sold', 'Your auction of :p1 :p2 sold for :p3.'],
        'tarequ' => ['monastery_schedule_changed', 'Schedule changed', 'You have changed the monastery\'s weekly schedule.'],
        'tarhom' => ['monk_schedule_changed', 'Schedule changed', 'You have changed the weekly schedule of :p1.'],
        'venefe' => ['sale_completed', 'Sale completed', 'Your sale of :p1 :p2 of :p3 is complete.'],
    ];

    /** @var array<string, string> legacy APLICABLE_A => applies_to */
    public const TRAIT_APPLIES_TO = [
        '3' => 'monastery',
        '4' => 'monk',
        '7' => 'building',
    ];

    /** @var array<string, string> legacy TIPO_CARACTERISTICA => group */
    public const TRAIT_GROUPS = [
        'hab' => 'skill',
        'vit' => 'vital',
    ];

    /** @var array<string, string> legacy TIPO => scale */
    public const TRAIT_SCALES = [
        'lin' => 'linear',
        'exp' => 'exponential',
        'log' => 'logarithmic',
    ];

    /** @var array<string, string> legacy UTILIDADID => building feature kind */
    public const FEATURE_KINDS = [
        'alm' => 'storage',
        'rea' => 'activity_places',
        'mec' => 'trait_bonus',
        'ten' => 'holds',
        'est' => 'field_state_places',
        'com' => 'activity_places',
        'cos' => 'activity_places',
        'prc' => 'activity_places',
        'sem' => 'activity_places',
    ];
}
