<?php

interface MyFileI
{
    public function render(): string;
}

abstract class MyFile
{
    public function __construct($name, $path)
    {
        $this->name = $name;
        $this->path = $path;
    }
}

class MyImage extends MyFile implements MyFileI
{
    public function render(): string
    {
        return sprintf('<li>%s</li>', $this->name);
    }
}

class MyDirectory extends MyFile implements MyFileI
{
    public function render(): string
    {
        return sprintf('<li><a href="%s">%s</a></li>', "/?path=" . $this->path, $this->name);
    }
}

class Explorer
{
    private $root_dir;
    private $path;
    
    public function __construct()
    {
        $path = $_GET['path'] ?? null;
        if ($path !== null && !preg_match('#^[A-Za-z0-9_-]*[/\\A-Za-z0-9_-]*$#', $path)) {
            throw new Exception("Передан некорректный параметр 'path'");
        }
        $this->root_dir = __DIR__;
        $this->path = trim($path ?? '', "/\\");
        $this->current = $this->root_dir . DIRECTORY_SEPARATOR . $this->path;
        
        if (!file_exists($this->current)) {
            throw new Exception("Каталог не найден!");
        }
    }
    
    public function create($name)
    {
        $currentPath = $this->current;
        if ($name === '.') {
            return null;
        }
        if ($name === '..') {
            $upPath = substr($currentPath, 0, strrpos($currentPath, '/'));
            if (strlen($upPath) == strlen($this->root_dir)) {
                if ($this->path == "") {
                    return null;
                }
                return new MyDirectory($name, "");
            } else {
                $path = substr($this->path, 0, strrpos(rtrim($this->path), '/'));
                return new MyDirectory($name, $path);
            }
            return null;
        }
        $itemPath = $currentPath . DIRECTORY_SEPARATOR . $name;
        if (!file_exists($itemPath)) {
            return null;
        }
        if (is_dir($itemPath)) {
            $path = ($this->path ? $this->path . DIRECTORY_SEPARATOR : '') . $name;
            return new MyDirectory($name, $path);
        }
        switch (strstr(mime_content_type($itemPath), '/', true)) {
            case 'image':
                return new MyImage($name, null);
            default:
                return null;
        }
    }
    
    public function renderList()
    {
        $list = scandir($this->current);
        if ($list === false) {
            $list = [];
        }
        $items = array_map(function (string $name) {
            $fileObj = $this->create($name);
            if ($fileObj === null) {
                return;
            }
            return $fileObj;
        }, $list);
        return sprintf(
            '<ul>%s</ul>',
            array_reduce(
                array_filter($items, function ($item) { return $item !== null; }),
                function($acc, MyFileI $item) {
                    return $acc .= $item->render();
                },
                ''
            )
        );
    }
}

try {
    $explorer = new Explorer();
    $content = $explorer->renderList();
} catch (Exception $ex) {
    $content = $ex->getMessage();
}
?>

<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Файловый менеджер</title>
  </head>

  <body>
    <div class="container">
        <?= $content ?>
    </div>
  </body>
</html>
