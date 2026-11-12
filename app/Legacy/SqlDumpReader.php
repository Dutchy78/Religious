<?php

/*
 * The Religious Game (revival).
 * Based on "The Religious Game" by Enric Mogas Nonell, Jugando en .NET, 2004.
 * Licensed under the GNU Affero General Public License v3.0 or later. See LICENSE.
 */

declare(strict_types=1);

namespace App\Legacy;

use RuntimeException;

/**
 * Reads a mysqldump / mariadb-dump file of the original 2005 game database
 * without needing a MySQL server.
 *
 * It understands CREATE TABLE (column names only) and INSERT ... VALUES
 * statements with MySQL string escaping. Everything else is ignored.
 *
 * The original database is latin1. A dump made with
 * --default-character-set=latin1 is Windows-1252 bytes; a dump that went
 * through a UTF-8 tool is UTF-8. Both are accepted: the file is decoded as
 * UTF-8 when it is valid UTF-8, otherwise as Windows-1252.
 *
 * Framework independent on purpose, so it can be tested with plain PHP.
 */
final class SqlDumpReader
{
    /** @var array<string, list<string>> */
    private array $columns = [];

    /** @var array<string, list<array<string, string|null>>> */
    private array $rows = [];

    private string $sourceEncoding = 'UTF-8';

    private function __construct() {}

    public static function fromFile(string $path): self
    {
        if (! is_file($path) || ! is_readable($path)) {
            throw new RuntimeException("Legacy dump not found or not readable: {$path}");
        }

        $bytes = file_get_contents($path);

        if ($bytes === false) {
            throw new RuntimeException("Could not read legacy dump: {$path}");
        }

        return self::fromString($bytes);
    }

    public static function fromString(string $bytes): self
    {
        $reader = new self;

        if (mb_check_encoding($bytes, 'UTF-8')) {
            $sql = $bytes;
        } else {
            $reader->sourceEncoding = 'Windows-1252';
            $sql = mb_convert_encoding($bytes, 'UTF-8', 'Windows-1252');
        }

        $reader->parse($sql);

        return $reader;
    }

    /** Encoding the file was read as: "UTF-8" or "Windows-1252". */
    public function sourceEncoding(): string
    {
        return $this->sourceEncoding;
    }

    /** @return list<string> */
    public function tables(): array
    {
        return array_keys($this->columns);
    }

    /** @return list<string> */
    public function columns(string $table): array
    {
        return $this->columns[$table] ?? [];
    }

    /** @return list<array<string, string|null>> */
    public function rows(string $table): array
    {
        return $this->rows[$table] ?? [];
    }

    public function hasTable(string $table): bool
    {
        return isset($this->columns[$table]);
    }

    /**
     * Number of string values that contain the Unicode replacement character,
     * i.e. text whose accents were lost before the dump reached us.
     */
    public function damagedValueCount(): int
    {
        $count = 0;

        foreach ($this->rows as $rows) {
            foreach ($rows as $row) {
                foreach ($row as $value) {
                    if ($value !== null && str_contains($value, "\u{FFFD}")) {
                        $count++;
                    }
                }
            }
        }

        return $count;
    }

    private function parse(string $sql): void
    {
        if (preg_match_all('/CREATE TABLE `([^`]+)` \((.*?)\n\)/s', $sql, $tables, PREG_SET_ORDER)) {
            foreach ($tables as [, $table, $body]) {
                preg_match_all('/^\s+`([^`]+)`/m', $body, $cols);
                $this->columns[$table] = $cols[1];
                $this->rows[$table] = [];
            }
        }

        $offset = 0;

        while (preg_match('/INSERT INTO `([^`]+)`(?: \(([^)]*)\))? VALUES\s*/', $sql, $m, PREG_OFFSET_CAPTURE, $offset)) {
            $table = $m[1][0];
            $start = $m[0][1] + strlen($m[0][0]);

            $columns = $this->columns[$table] ?? [];

            if (isset($m[2]) && $m[2][1] !== -1 && $m[2][0] !== '') {
                $columns = array_map(
                    fn (string $c): string => trim($c, ' `'),
                    explode(',', $m[2][0]),
                );
            }

            [$tuples, $offset] = $this->readTuples($sql, $start);

            foreach ($tuples as $values) {
                if ($columns === [] || count($columns) !== count($values)) {
                    throw new RuntimeException(sprintf(
                        'Column count mismatch in %s: expected %d values, got %d.',
                        $table,
                        count($columns),
                        count($values),
                    ));
                }

                $this->rows[$table][] = array_combine($columns, $values);
            }
        }
    }

    /**
     * Reads "(...),(...),...;" starting at $pos.
     *
     * @return array{0: list<list<string|null>>, 1: int}
     */
    private function readTuples(string $sql, int $pos): array
    {
        $tuples = [];
        $length = strlen($sql);
        $row = null;
        $value = '';
        $quoted = false;
        $inString = false;

        while ($pos < $length) {
            $char = $sql[$pos];

            if ($inString) {
                if ($char === '\\' && $pos + 1 < $length) {
                    $next = $sql[$pos + 1];
                    $value .= match ($next) {
                        'n' => "\n",
                        'r' => "\r",
                        't' => "\t",
                        '0' => "\0",
                        'Z' => "\x1A",
                        default => $next, // \\ \' \" and anything else
                    };
                    $pos += 2;

                    continue;
                }

                if ($char === "'") {
                    if (($sql[$pos + 1] ?? '') === "'") {
                        $value .= "'";
                        $pos += 2;

                        continue;
                    }

                    $inString = false;
                    $pos++;

                    continue;
                }

                $value .= $char;
                $pos++;

                continue;
            }

            if ($row === null) {
                if ($char === '(') {
                    $row = [];
                    $value = '';
                    $quoted = false;
                } elseif ($char === ';') {
                    return [$tuples, $pos + 1];
                }

                $pos++;

                continue;
            }

            if ($char === "'") {
                $inString = true;
                $quoted = true;
            } elseif ($char === ',') {
                $row[] = $this->finishValue($value, $quoted);
                $value = '';
                $quoted = false;
            } elseif ($char === ')') {
                $row[] = $this->finishValue($value, $quoted);
                $tuples[] = $row;
                $row = null;
            } elseif (! ctype_space($char)) {
                $value .= $char;
            }

            $pos++;
        }

        throw new RuntimeException('Unexpected end of dump while reading INSERT values.');
    }

    private function finishValue(string $value, bool $quoted): ?string
    {
        if (! $quoted && strtoupper($value) === 'NULL') {
            return null;
        }

        return $value;
    }
}
