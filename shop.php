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
		$result=mysqli_query($db, "select name, price, image from items where name like '%" . $_GET['searchBox'] . "%';") or die(mysqli_error($db));
		print "<table><tr>
					<tr>Item</tr>
					<tr>Image</tr>
					<tr>Price</tr>
					<tr>Buy</tr>
			   </tr><br/>";
		while($row = $result->fetch_assoc())
		{
			print "<tr>" . $row["name"] . "</tr>";
			print "<tr>" . $row["image"] . "</tr>";
			print "<tr>" . $row["price"] . "</tr>";
			print "<tr>" . "<form/>" . "</tr>";
		}
		print "</table>";
	}
?>


</body>
</html>