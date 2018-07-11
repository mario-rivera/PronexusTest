<?php
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\JsonResponse;

$app->get('/', function() use($app) {

    $token = $app['security.token_storage']->getToken();
    $user = $token->getUser();

    // $user->getUsername()
    return $app['twig']->render('map.html', []);
});

$app->get('/login', function(Request $request) use ($app) {

    return $app['twig']->render('login.html', array(
        'error'         => $app['security.last_error']($request),
        'last_username' => $app['session']->get('_security.last_username'),
    ));
});

$app->get('/register', function() use($app) {

    return $app['twig']->render('register.html', array());
})->bind('register');

$app->post('/register', function(Request $request) use($app) {

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
});

$app->get('/api/provinces/{id}/recipes', function(Request $request, $id) use($app) {

    $retriever = new \App\Provinces\ProvinceRecipeRetriever($app['db']);
    $result = $retriever->getRecipes($id, $request->get('cat', NULL));

    return new JsonResponse($result);
});
