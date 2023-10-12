<?php
// index.php

require_once 'vendor/autoload.php'; // Assuming Twig is installed via Composer

// Set up Twig
$loader = new \Twig\Loader\FilesystemLoader(__DIR__ . '/templates');
$twig = new \Twig\Environment($loader);

// Set environment variables for development
if (php_sapi_name() === 'cli' || isset($_SERVER['TERM_PROGRAM'])) {
    putenv('NODE_ENV=development');
}

// Render Twig template
echo $twig->render('index.twig', ['environmentMode' => getenv('NODE_ENV')]);
