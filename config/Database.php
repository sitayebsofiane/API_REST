<?php
class Database{
    // Connexion à la base de données
    private $host = "localhost";
    private $db_name = "api_rest";
    private $username = "postgres";
    private $password = "as122014";
    public $connexion;

    // getter pour la connexion
    public function getConnection(){

        $this->connexion = null;

        try{
            $this->connexion = new  PDO("pgsql:host=".$this->host.";dbname=".$this->db_name,$this->username,$this->password);;
            $this->connexion->exec("set names utf8");
        }catch(PDOException $exception){
            echo "Erreur de connexion : " . $exception->getMessage();
        }

        return $this->connexion;
    }   
}