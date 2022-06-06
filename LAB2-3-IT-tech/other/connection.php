<?php
$dsn = "mysql:host=localhost; dbname=librarydb";
$user = 'root';
$pass = '';
try {
    $dbh = new PDO($dsn,$user,$pass);

} catch (PDOException $e) {
    echo "Ошибка!";
}