<?php
require_once 'vendor/autoload.php'; // Assuming Twig is installed via Composer

// Set up Twig
$loader = new \Twig\Loader\FilesystemLoader(__DIR__ . '/templates');
$twig = new \Twig\Environment($loader);

// render twig page
echo $twig->render('help.twig');
?>