<?php require 'other/author.php'; ?>
<?php require 'other/publisher.php'; ?>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
	<meta http-equiv="Cache-Control" content="no-cache">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Лабораторная работа №3</title>
    <script src="js/ajax.js"></script>
</head>
<body>
    <p><b>Книги указанного автора:</b></p>
    <select name="auth" id="">
        <?php
        foreach ($out as $author) {
            echo "<option value=\"$author\">$author</option>";
        }
        ?>
    </select>
    <p><input type="button" value="Test" onclick="getPage();"></p>
    <div id="result1"></div>
    <p><b>Книги, журналы и газеты, опубликованныу за указанный временной период:</b></p>
    <form action="times.php" name="time" id="">
	   <input type="date" name="date_start" required="required">
	   <input type="date" name="date_end" required="required">
    </form>
    <p><input type="button" value="Test2" onclick="getDate();"></p>
    <div id="result3"></div>
    <p><b>Книги указанного издательства:</b></p>
		<select name="publs" id="">
			<?php
			foreach ($outres as $resb) {
				echo "<option value=\"$resb\">$resb</option>";
			}
			?>
		</select>
    <p><input type="button" value="Test2" onclick="getPubl();"></p>
    <div id="result2"></div>
<script src="js/jquery-3.5.0.min.js"></script>
</body>
</html>