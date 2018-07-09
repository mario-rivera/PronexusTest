<?php 
namespace App\Users;

use Doctrine\DBAL\Connection;

class UserRegistrar{
    
    private $conn;

    public function __construct(Connection $conn)
    {
        $this->conn = $conn;
    }
    
    public function register($username, $password){
            
        return $this->conn->insert('users', [
            'username' => $username,
            'password' => $password,
            'roles' =>  'ROLE_ADMIN'
        ]);
    }
}