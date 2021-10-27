<?php session_start() ?>
<!DOCTYPE html>
<html>
<body>
<head>
    <title>Shopping Page</title>
    <link href="style.css" type="text/css" rel="stylesheet"/>
</head>
<h1 id = 'loginHeader'>Available Items</h1>
<center>
<div id='searchPanel'>
	<form action = "http://localhost/Price-Arena/shop.php">
		<input type='text' class='textbox' id='searchBox' name='searchBox' method='get'/>
		<input type='submit' class='submit' id='searchSubmit' name='searchSubmit' value='Search'>
	</form>
</div>
</center>
<?php
	if(isset($_GET["searchSubmit"]))
	{
		$db = mysqli_connect("localhost:3306", "root", "", "pricearena");
		$result=mysqli_query($db, "select * from items where username like '%" . $_GET['searchBox'] . "%';");
	}
?>


</body>
</html>