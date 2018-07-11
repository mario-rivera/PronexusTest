<?php
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\JsonResponse;

$app->get('/', [\App\Controllers\MapController::class, 'get']);
$app->get('/login', [\App\Controllers\LoginController::class, 'get']);
$app->get('/register', [\App\Controllers\RegisterController::class, 'get'])->bind('register');
$app->post('/register', [\App\Controllers\RegisterController::class, 'post']);
$app->get('/api/provinces/{id}/recipes', [\App\Controllers\ProvincesRecipesController::class, 'get']);
