<?php
namespace App;

use Silex\Application;

class HelloDutch extends Application{
    
    public function load(){
        
        $this['debug'] = true;
        $this['dir.base'] = dirname(__DIR__);
        
        $this->bootServiceProviders();
        
        return $this;
    }
    private function bootServiceProviders(){
        
        $providers =  require_once  __DIR__ . '/ServiceProviders/definitions.php';
        
        foreach( $providers as $provider ){
            
            $this->register(new $provider);
        }
    }
}