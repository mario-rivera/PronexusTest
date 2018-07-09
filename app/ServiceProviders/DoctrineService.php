<?php
namespace App\ServiceProviders;

use Pimple\ServiceProviderInterface;
use Pimple\Container;

class DoctrineService implements ServiceProviderInterface{
    
    public function register(Container $app){
        
        $app->register(new \Silex\Provider\DoctrineServiceProvider(), array(
            'db.options' => array(
                'driver'   => 'pdo_mysql',
                'dbname'     => 'hellodutch',
                'host'     => 'hello-dutch-mysql',
                'user'     => 'root',
                'password'     => 'root',
            ),
        ));
    }
}