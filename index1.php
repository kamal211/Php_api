<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);
header ("Access-Control-Allow-Origin: *");
header ("Access-Control-Allow-Headers: *");


include 'DbConnect.php';
$objDb = new DbConnect;
$conn = $objDb->connect();
var_dump($conn);
$user =(file_get_contents('php://input'));
$method = $_SERVER['REQUEST_METHOD'];
switch ($method) {
    case 'GET':
        $sql = "SELECT * FROM users";
        $stmt = $conn->prepare($sql);
        $stmt->execute();
        $users = $stmt->fetchAll(PDO::FETCH_ASSOC);
        echo json_encode($users);
        break;
    case 'POST':
        $user = json_decode((file_get_contents('php://input')));
        $sql = "INSERT INTO `utilisateur`(`nom`, `prenom`, `adresse`, `email`, `motDePasse`, `creer_le`, `type`) VALUES (:nom, :prenom, :adresse, :email, :motDePasse, :creer_le, :type)";
        // $sql = "INSERT INTO utilisateur (nom, prenom, adresse, email, motDePasse, creer_le) VALUES (:nom, :prenom, :adresse, :email, :motDePasse, :creer_le)";
        $stmt = $conn->prepare($sql);
        $creer_le = date('Y-m-d');
        $stmt->bindParam(':nom', $user->nom);
        $stmt->bindParam(':prenom', $user->prenom);
        $stmt->bindParam(':adresse', $user->adresse);
        $stmt->bindParam(':email', $user->email);
        $stmt->bindParam(':motDePasse', $user->motDePasse);
        $stmt->bindParam(':type', $user->type);
        $stmt->bindParam(':creer_le', $creer_le);
        if($stmt->execute()) 
        {
            $response = ['status' => 1, 'message' => 'Record created successfully'];
        }else {
            $response = ['status' => 0, 'message' => 'Failed to create record'];
        }
        echo json_encode($response);


        break;
       
}
