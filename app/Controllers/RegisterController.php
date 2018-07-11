<?php
namespace App\Controllers;

use Silex\Application;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\JsonResponse;

class RegisterController{

    public function get(Application $app, Request $request){

        return $app['twig']->render('register.html', array());
    }

    public function post(Application $app, Request $request){

        try{

            $data = $request->request->all();
            \Respect\Validation\Validator::key('_username')->key('_password')->assert($data);

            $username = $data['_username'];
            $password = $data['_password'];

            \Respect\Validation\Validator::stringType()->notEmpty()->setName("Username")->assert( $username );
            \Respect\Validation\Validator::stringType()->notEmpty()->setName("Password")->assert( $password );

            $registrar = new \App\Users\UserRegistrar($app['db']);
            $registrar->register($username, $app['security.default_encoder']->encodePassword($password, NULL));

        }catch( \Respect\Validation\Exceptions\ExceptionInterface $e ){

            return $app['twig']->render('register.html', [
                'error' => $e->getFullMessage(),
                'validation_messages' => $e->getMessages()
            ]);
        }catch(\Doctrine\DBAL\Exception\UniqueConstraintViolationException $e){

            return $app['twig']->render('register.html', [
                'error' => 'Username already exists'
            ]);
        }

        // Create a sub request which pretends to be a user login request.
        $loginRequest = Request::create(
            "/login_check",
            'POST',
            $data,
            $request->cookies->all(),
            $request->files->all(),
            $request->server->all()
        );

        // Let our application handle the login request.
        return $app->handle($loginRequest);
    }
}
