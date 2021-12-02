<?php session_start() ?>
<?php include "header.php"?>
<!DOCTYPE html>
<html>
<body>
<head>
    <title>Cart Page</title>
    <link href="style.css" type="text/css" rel="stylesheet"/>
</head>
<br/><br/><br/>
<h1 id = 'loginHeader'>Cart</h1>
<?php
    $db = mysqli_connect("localhost:3306", "root", "", "pricearena");
    if(isset($_GET["checkout"]))
        mysqli_query($db, "DELETE from cart where userName = '" . $_SESSION["username"] . "';") or die(mysqli_error($db));
    $result = mysqli_query($db, "SELECT * from (SELECT * from cart temp where username ='" . $_SESSION["username"] . "') temp INNER JOIN items on temp.itemID = items.itemID;") or die(mysqli_error($db));
    while($row = $result->fetch_assoc())
    {
        if(isset($_GET[$row["itemID"]]))
        {
            mysqli_query($db, "DELETE FROM cart where itemID = '". $row["itemID"] ."' AND userName = '" . $_SESSION["username"] . "';") or die(mysqli_error($db));
            mysqli_query($db, "UPDATE users SET moneySpent = moneySpent - " . ($row["quantity"] * $row["price"]) . " where userName = '". $_SESSION["username"] ."';") or die(mysqli_error($db));
            mysqli_query($db, "UPDATE users SET amountBought = amountBought - " . $row["quantity"] . " where userName = '". $_SESSION["username"] ."';") or die(mysqli_error($db));
        }
    } 
    $result = mysqli_query($db, "SELECT * from (SELECT * from cart temp where username ='" . $_SESSION["username"] . "') temp INNER JOIN items on temp.itemID = items.itemID;") or die(mysqli_error($db));
    print "<center>
           <table id = 'cartpage' style='width: 80%;'>
           <th> Name </th>
           <th> Price </th>
           <th> Image </th>
           <th> Quantity </th>
           <th> Remove From Cart </th>";
    $total = 0;
    while($row = $result->fetch_assoc())
    {
        if($row["quantity"] > 0)
            print "<tr>
                   <td>" . $row["name"] . "</td>
                   <td>$" . $row["price"] . "</td>
                   <td><center><img src='" . $row["image"] . "'/></center></td>
                   <td>" . $row["quantity"] . "</td>
                   <td><form action='http://localhost/Price-Arena/cart.php' id='removeSubmit' name='removeSubmit'><center><input type='submit' class='submit' id='removeSubmit' name='" . $row["itemID"] .  "' value='Remove' /></center></form></td></tr>";
        $total = $total + $row["quantity"] * $row["price"];
    }
    print "<tr><td colspan='5'><center>Total: $" . $total . "</center></td></tr></table></center>";
?>
<br/>
<center>
    <form action='http://localhost/Price-Arena/cart.php' id='checkout' name='checkout'>
        <input type ='submit' class='submit' id='checkout' name='checkout' value='Checkout'></input>
    </form>
</center>
</body>
</html>