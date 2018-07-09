<?php
namespace App\ServiceProviders;

use Pimple\ServiceProviderInterface;
use Pimple\Container;

class TwigService implements ServiceProviderInterface{
    
    public function register(Container $app){
        
        $app->register(new \Silex\Provider\TwigServiceProvider(), array(
            'twig.path' => __DIR__.'/../../views',
        ));
    }
}