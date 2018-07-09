<?php
namespace App\ServiceProviders;

use Pimple\ServiceProviderInterface;
use Pimple\Container;

class RouteService implements ServiceProviderInterface{
    
    public function register(Container $app){
        
        require_once $app['dir.base'] . '/app/Http/routes.php';
    }
}