<?php

/**
 * This page is used to redirect the user to their intended destination.
 */
require_once 'Shortener.php';
$s = new Shortener();

$s->getUserData();
header('Location: ' . $s->resolveShortUrl(filter_input(INPUT_GET, 'shorturl')));
$s->storeData();
