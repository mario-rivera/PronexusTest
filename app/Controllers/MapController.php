<?php
namespace App\Controllers;

use Silex\Application;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\JsonResponse;

class MapController{

    public function get(Application $app, Request $request){

        $token = $app['security.token_storage']->getToken();
        $user = $token->getUser();

        return $app['twig']->render('map.html', []);
    }
}
