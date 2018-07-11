<?php
namespace App\Controllers;

use Silex\Application;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\JsonResponse;

class ProvincesRecipesController{

    public function get(Application $app, Request $request, $id){

        $retriever = new \App\Provinces\ProvinceRecipeRetriever($app['db']);
        $result = $retriever->getRecipes($id, $request->get('cat', NULL));

        return new JsonResponse($result);
    }
}
