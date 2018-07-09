<?php
return [
    App\ServiceProviders\TwigService::class,
    Silex\Provider\SessionServiceProvider::class,
    App\ServiceProviders\DoctrineService::class,
    App\ServiceProviders\SecurityService::class,
    App\ServiceProviders\RouteService::class
];