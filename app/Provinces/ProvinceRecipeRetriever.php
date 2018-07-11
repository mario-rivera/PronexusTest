<?php
namespace App\Provinces;
use Doctrine\DBAL\Connection;

class ProvinceRecipeRetriever{

    private $conn;

    public function __construct(Connection $conn)
    {
        $this->conn = $conn;
    }

    public function getRecipes($province_id, $recipe_id){

        $query_param_bindings = [$province_id];
        $query = "
        SELECT * FROM recipe r
            LEFT JOIN province_recipe pr ON pr.recipe_id = r.id
        WHERE pr.province_id = ?
        ";

        if($category_id){

            $query_param_bindings[] = $category_id;
            $query .= " AND r.category_id = ?";
        }

        $stmt = $this->conn->executeQuery($query, $query_param_bindings);
        return $stmt->fetchAll();
    }
}
