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
	$db = mysqli_connect("localhost:3306", "root", "", "pricearena");
	print "<br/><div class='row'><div class='column'>
	       <table>
				<th colspan='2'>Top 5 Most Bought</th>
				<tr><td>Name</td><td>Amount Bought</td></tr>";
	$result = mysqli_query($db, "select itemID, SUM(quantity) from cart group by itemID order by SUM(quantity), itemID;")or die(mysqli_error($db));
	$temp = mysqli_query($db, "select count(itemID) from cart");
	$temp = $temp->fetch_assoc();
	$cartCount = $temp["count(itemID)"];
	if($cartCount != 0)
	{
		if($cartCount > 5) {$cartCount = 5;}
		while($row = $result->fetch_assoc())
		{
			$array[] = $row;
		}
		$array = array_reverse($array, true);
		foreach($array as $row)
		{
			if($cartCount == 0)
				break;
			$result2 = mysqli_query($db, "select name from items where itemID = '" . $row["itemID"] . "';")or die(mysqli_error($db));
			$row2 = $result2->fetch_assoc();
			print "<tr><td>" . $row2["name"] . "</td><td>" . $row["SUM(quantity)"] . "</td></tr>";
			$cartCount--;
		}
	}

	print "</table></div>";
	print "<div class='column'><table><th>        Name        </th>
	   <th> Price </th>
	   <th>        Image        </th>
	   <th id='cartColumn'>Add To Cart</th>";
	if(isset($_GET["searchSubmit"]))
	{
		$result=mysqli_query($db, "select * from items where name like '%" . $_GET['searchBox'] . "%';") or die(mysqli_error($db));
	}
	else
	{
		$result = mysqli_query($db, "select * from items;") or die(mysqli_error($db));
	}
    while($row = $result->fetch_assoc())
    {
    	print "<tr>";
    	print "<td>" . $row["name"] . "</td>";
    	print "<td>$" . $row["price"] . "</td>";
    	print "<td><center><img src='" . $row["image"] . "'/></center></td>";
    	print "<td><form action='http://localhost/Price-Arena/shop.php' id='cartSubmit' name='cartSubmit'><center><input type='number' class='numBox' id='quantity' value='0' min='0' name='" . $row["itemID"] . "'><input type='submit' class='submit' id='cartSubmit' name='cartSubmit' value='Add To Cart' /></center></form></td>";
    }
    print "</table></div>";
    if(isset($_GET["cartSubmit"]))
    {
    	$result = mysqli_query($db, "select itemID from items order by itemID;")or die(mysqli_error($db));
    	while($row = $result->fetch_assoc()) 
    	{
    		if(isset($_GET[$row["itemID"]]))
    		{
    			mysqli_query($db, "UPDATE items SET timesBought = timesBought + " . $_GET[$row["itemID"]] . " WHERE itemID = " . $row["itemID"] . ";");
    			mysqli_query($db, "UPDATE users SET amountBought = amountBought + " . $_GET[$row["itemID"]] . " WHERE userName = '" . $_SESSION["username"] . "';") or die(mysqli_error($db));
    			mysqli_query($db, "UPDATE users SET moneySpent = moneySpent + " . $_GET[$row["itemID"]] . " * (select price from items where itemID = " . $row["itemID"] . ") WHERE userName = '" . $_SESSION["username"] . "';") or die(mysqli_error($db));
    			//mysqli_query($db, "");
    			$result2 = mysqli_query($db, "select itemID, userName from cart where itemID = " . $row["itemID"] . " and userName = '" . $_SESSION["username"] . "';") or die(mysqli_error($db));
    			$row2 = $result2->fetch_assoc();
		    	if($row2["itemID"] == '' and $row2["userName"] == '')
		    	{
		    		$itemID = $row["itemID"];
		    		$username = $_SESSION["username"];
		    		$quantity = $_GET[$row["itemID"]];
		    		mysqli_query($db, "insert into cart (itemID, userName, quantity) values ('$itemID', '$username', $quantity);") or die(mysqli_error($db));
		    	}
		    	else
		    	{
		    		$query = "update cart set quantity = quantity + " . $_GET[$row["itemID"]] . " where userName = '" . $_SESSION["username"] . "' and itemID = '" . $row["itemID"] . "';";
		    		mysqli_query($db, $query)or die(mysqli_error($db));
		    	}
		    	break;
    		}
    	}
    }
    print "<div class='column'>
	       <table>
				<th colspan='2'>Top 5 Buyers</th>
				<tr><td>Name</td><td>Money Spent</td></tr>";
	$result = mysqli_query($db, "select userName, moneySpent from users order by moneySpent;")or die(mysqli_error($db));
	$temp = mysqli_query($db, "select count(userName) from users")or die(mysqli_error($db));
	$temp = $temp->fetch_assoc();
	$userCount = $temp["count(userName)"];
	while($row = $result->fetch_assoc())
	{
		$array[] = $row;
	}
	$array = array_reverse($array, true);
	foreach($array as $row)
	{
		if($userCount == 0)
			break;
		print "<tr><td>" . $row["userName"] . "</td><td>$" . $row["moneySpent"] . "</td></tr>";
		$userCount--;
	}

	print "</table></div>";
    print "<div class='column'>
	       <table>
				<th colspan='2'>Top 5 Most Bought</th>
				<tr><td>Name</td><td>Amount Bought</td></tr>";
	$result = mysqli_query($db, "select userName, moneySpent from users order by moneySpent;")or die(mysqli_error($db));
	$temp = mysqli_query($db, "select count(userName) from users")or die(mysqli_error($db));
	$temp = $temp->fetch_assoc();
	$userCount = $temp["count(userName)"];
	if($userCount > 5) { $userCount = 5; }
	while($row = $result->fetch_assoc())
	{
		$array[] = $row;
	}
	$array = array_reverse($array, true);
	foreach($array as $row)
	{
		if($userCount == 0)
			break;
		print "<tr><td>" . $row["userName"] . "</td><td>$" . $row["moneySpent"] . "</td></tr>";
		$userCount--;
	}

	print "</table></div></div>";

?>


</body>
</html>