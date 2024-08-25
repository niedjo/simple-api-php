<?php

// phpinInfo
// Headers requis
// Accès depuis n'importe quel site ou appareil (*)
header("Access-Control-Allow-Origin: *");

// Format des données envoyées
header("Content-Type: application/json; charset=UTF-8");

// Méthode autorisée
header("Access-Control-Allow-Methods: GET");

// Durée de vie de la requête
header("Access-Control-Max-Age: 3600");

// Entêtes autorisées
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

if($_SERVER['REQUEST_METHOD'] == 'GET'){
    // On inclut les fichiers de configuration et d'accès aux données
    
    $server = 'localhost';
    $dbname = "api_rest";
    $username = "root";
    $password = "";

    $bdd = new PDO("mysql:host=$server;dbname=$dbname",$username,$password);
    $bdd->exec("set names utf8");

    $requette = $bdd->query("SELECT * FROM categories");
    
    $tableauProduits = [];
    $tableauProduits['produits'] = [];


    // $requette->rowCount();
    // var_dump($tableauProduits);
    while ($reponse = $requette->fetch()) {
        extract($reponse);
        $prod = [
            "id" => $id,
            "nom" => $nom,
            "description" => $description,
            "prix" => $created_at,
            "categories_id" => $updated_at,
        ];
        
        $tableauProduits['produits'][] = $prod;
    }
    // var_dump($tableauProduits);
    // On envoie le code réponse 200 OK
        http_response_code(200);

        // On encode en json et on envoie
        echo json_encode($tableauProduits);

}
else {
    // mauvaise methode, on gere l'erreur

    http_response_code(405);
    echo json_encode(["message" => "la methode n'est pas autorisee"]);
}