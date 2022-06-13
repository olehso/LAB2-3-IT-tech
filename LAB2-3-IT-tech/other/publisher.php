<?php
$dsn = "mysql:host=localhost; dbname=librarydb";
$user = 'root';
$pass = '';
try {
    $dbh = new PDO($dsn,$user,$pass);
    $resb = "SELECT DISTINCT publisher FROM `LITERATURE` WHERE publisher IS NOT NULL";
    $outres[] = array();
    unset($outres[0]);

    foreach ($dbh->query($resb) as $row) {
        $outres[] .= $row['publisher'];
    }
} catch (PDOException $e) {
    echo "Ошибка!";
}