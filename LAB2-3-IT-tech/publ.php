<?php
header('Content-Type: text/xml');
header("Cache-Control: no-cache, must-revalidate");

$dsn = "mysql:host=localhost; dbname=librarydb";
$user = 'root';
$pass = '';
try {
    $dbh = new PDO($dsn,$user,$pass);

    $blink = $_GET["publs"];

    $house = "SELECT * FROM literature LEFT JOIN resourse ON literature.FID_Resourse = resourse.ID_Resourse WHERE publisher = '". $blink ."'";

   $i = 1;
    if (!empty($house)){
		echo '<?xml version="1.0" encoding="utf8" ?>';
		echo "<root>";
        foreach ($dbh->query($house) as $raw) {
			echo '<publ>'."Книга ". $i .'</publ>';
            echo '<publ>'."Издательства ".$raw['publisher'].'</publ>';
			echo '<publ>'."Название: ".$raw['name'].'</publ>';
			echo '<publ>'."Год издания: ".$raw['year'] . '</publ>';
			echo '<publ>'."Количество страниц: ".$raw['quantity'] . '</publ>';
			echo '<publ>'."Код ISBN: ".$raw['ISBN'] .'</publ>';
			echo '<publ>'."Доп. Ресурс: ".$raw['title'] .'</publ>';
			echo '<publ>'. "" .'</publ>';
			$i++;
        }
		echo "</root>";
    }
    else{
        echo "ошибка";
    }
} catch (PDOException $e) {
    echo "Ошибка";
}