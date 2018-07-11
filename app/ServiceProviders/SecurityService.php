<?php
namespace App\ServiceProviders;

use Pimple\ServiceProviderInterface;
use Pimple\Container;
use App\Users\UserProvider;

class SecurityService implements ServiceProviderInterface{

    public function register(Container $app){

        $app->register(new \Silex\Provider\SecurityServiceProvider(), array(
            'security.firewalls' => [
                'login' => array(
                    'pattern' => '^/login$',
                ),
                'register' => array(
                    'pattern' => '^/register$',
                ),
                'api' => array(
                    'pattern' => '^/api/.*$',
                ),
                'secured' => array(
                    'pattern' => '^.*$',
                    'form' => array('login_path' => '/login', 'check_path' => '/login_check'),
                    'logout' => array('logout_path' => '/logout', 'invalidate_session' => true),
                    'users' => function () use ($app) {
                        return new UserProvider($app['db']);
                    },
                    // 'users' => array(
                    //     // raw password is foo
                    //     'admin' => array('ROLE_ADMIN', '$2y$10$3i9/lVd8UOFIJ6PAMFt8gu3/r5g0qeCJvoSlLCsvMTythye19F77a'),
                    // ),
                ),
            ]
        ));
    }
}
