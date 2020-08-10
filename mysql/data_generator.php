<?php

chdir(dirname(__DIR__));
require_once __DIR__ . '/../vendor/autoload.php';

class Moto
{
    public $id;
    public $type_id;
    public $in_production;
    
    public static function getSql($n = 50)
    {
        if ($n <= 1) {
            return '$n > 1';
        }
        $faker = \Faker\Factory::create();
        $rows = [];
        foreach (range(1, $n) as $i) {
            $type_id = $faker->numberBetween($min = 1, $max = 8);
            $id_production = $faker->numberBetween($min = 0, $max = 1);
            $rows[] = sprintf("(%s,%s,%s)", $i, $type_id, $id_production);
        }
        $sql = sprintf("INSERT INTO motorcycles(id,type_id,in_production) VALUES %s;", implode(',', $rows));
        return $sql;
    }
}

class Type
{
    public $id;
    public $name;
    
    public static function getList()
    {
        return [
            1 => 'Classic',
            2 => 'Cruiser',
            3 => 'Sport bike',
            4 => 'Touring',
            5 => 'Sport touring',
            6 => 'Dual-sport',
            7 => 'Enduro',
            8 => 'Motocross',
        ];
    }
    
    public static function getSql()
    {
        $types = self::getList();
        $rows = [];
        foreach ($types as $key => $name) {
            $rows[] = sprintf("(%s,'%s')", $key, $name);
        }
        $sql = sprintf("INSERT INTO types(id,name) VALUES %s;", implode(',', $rows));
        return $sql;
    }
}

$typesData = Type::getSql();
$motorcyclesData = Moto::getSql(100);
$data = "use dikidi;\nTRUNCATE TABLE `types`; TRUNCATE TABLE `motorcycles`;\n" . $typesData . "\n" . $motorcyclesData . "\n";
file_put_contents('mysql/data_dump.sql', $data);
