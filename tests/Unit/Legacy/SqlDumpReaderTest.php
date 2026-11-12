<?php

/*
 * The Religious Game (revival).
 * Based on "The Religious Game" by Enric Mogas Nonell, Jugando en .NET, 2004.
 * Licensed under the GNU Affero General Public License v3.0 or later. See LICENSE.
 */

declare(strict_types=1);

namespace Tests\Unit\Legacy;

use App\Legacy\SqlDumpReader;
use PHPUnit\Framework\TestCase;

class SqlDumpReaderTest extends TestCase
{
    private const DUMP = <<<'SQL'
        CREATE TABLE `_THING` (
          `ID` char(3) NOT NULL DEFAULT '',
          `NAME` varchar(50) DEFAULT NULL,
          `AMOUNT` double NOT NULL DEFAULT 0,
          PRIMARY KEY (`ID`)
        ) ENGINE=InnoDB;
        INSERT INTO `_THING` VALUES ('a','It\'s \"quoted\", (with) commas',1.5),('b',NULL,-2),
        ('c','Line\nbreak and \\ backslash',0),('d','doubled '' quote',3);
        CREATE TABLE `_EMPTY` (
          `ID` int(11) NOT NULL
        );
        SQL;

    public function test_reads_columns_and_rows(): void
    {
        $reader = SqlDumpReader::fromString(self::DUMP);

        $this->assertSame(['_THING', '_EMPTY'], $reader->tables());
        $this->assertSame(['ID', 'NAME', 'AMOUNT'], $reader->columns('_THING'));
        $this->assertCount(4, $reader->rows('_THING'));
        $this->assertSame([], $reader->rows('_EMPTY'));
    }

    public function test_handles_mysql_escaping_and_null(): void
    {
        $rows = SqlDumpReader::fromString(self::DUMP)->rows('_THING');

        $this->assertSame('It\'s "quoted", (with) commas', $rows[0]['NAME']);
        $this->assertSame('1.5', $rows[0]['AMOUNT']);
        $this->assertNull($rows[1]['NAME']);
        $this->assertSame('-2', $rows[1]['AMOUNT']);
        $this->assertSame("Line\nbreak and \\ backslash", $rows[2]['NAME']);
        $this->assertSame("doubled ' quote", $rows[3]['NAME']);
    }

    public function test_decodes_latin1_dumps(): void
    {
        $latin1 = mb_convert_encoding(
            "CREATE TABLE `_T` (\n  `N` varchar(20)\n);\nINSERT INTO `_T` VALUES ('Almacén'),('Sótanos');",
            'Windows-1252',
            'UTF-8',
        );

        $reader = SqlDumpReader::fromString($latin1);

        $this->assertSame('Windows-1252', $reader->sourceEncoding());
        $this->assertSame('Almacén', $reader->rows('_T')[0]['N']);
        $this->assertSame('Sótanos', $reader->rows('_T')[1]['N']);
        $this->assertSame(0, $reader->damagedValueCount());
    }

    public function test_counts_damaged_text(): void
    {
        $reader = SqlDumpReader::fromString("CREATE TABLE `_T` (\n  `N` varchar(20)\n);\nINSERT INTO `_T` VALUES ('Almac\u{FFFD}n'),('ok');");

        $this->assertSame('UTF-8', $reader->sourceEncoding());
        $this->assertSame(1, $reader->damagedValueCount());
    }
}
