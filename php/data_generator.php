<?php

chdir(dirname(__DIR__));
require_once __DIR__ . '/../vendor/autoload.php';

class Gen
{
    public $baseDir;
    public $maxLevel;
    public $faker;

    public function __construct($minItems = 3, $maxItems = 10, $maxLevel = 3)
    {
        $this->baseDir = __DIR__;
        $this->faker = \Faker\Factory::create();
        $this->maxLevel = $maxLevel;
        $this->minItems = $minItems;
        $this->maxItems = $maxItems;
    }
    
    public function generateDirectory($currentDir, $currentLevel)
    {
        foreach (range($this->minItems, $this->maxItems) as $i) {
            $name = $this->faker->unique()->md5();
            switch (random_int(1, 3)) {
                case 1:
                    $this->faker->image($currentDir);
                    break;
                case 2:
                    $content = $this->faker->text(500);
                    $filename = $currentDir . DIRECTORY_SEPARATOR . $name . '.txt';
                    file_put_contents($filename, $content);
                    break;
                default:
                    $newDir = $currentDir . DIRECTORY_SEPARATOR . $name;
                    mkdir($newDir);
                    if ($currentLevel < $this->maxLevel) {
                        $this->generateDirectory($newDir, $currentLevel + 1);
                    }
                    break;
            }
        }
    }
    
    public function run()
    {
        $this->generateDirectory($this->baseDir, 0);
    }
}

$gen = new Gen();
$gen->run();
