<?php session_start() ?>
<!DOCTYPE html>
<html>
<body>
<head>
    <title>Login to Price-Arena</title>
    <link href="style.css" type="text/css" rel="stylesheet"/>
</head>
<h1 id = 'loginHeader'>Enter The Arena</h1>
<br/>
</body>
<center>
<div class="tab">
    <button class="tablinks" id="login" onclick="openTab(event, 'loginPanel')">Login</button>
    <button class="tablinks" id="register" onclick="openTab(event, 'registerPanel')">Register</button>
</div>
</center>
<div id = 'loginPanel' class = 'tabcontent'>
    <form action='http://localhost/Price-Arena/login.php'>
        <br/>
        <label for='username'>Username</label>
        <center><input type='text' class='textbox' id='username' name='username' method='get'/></center>
        <br/>
        <label for='password'>Password</label>
        <center><input type='password' class='textbox' id='password' name='password' method='get'/></center>
        <br/><br/>
        <input type="submit" class='submit' id='loginSubmit' name='loginSubmit' value='Login'>
    </form>
    <br/>
</div>
<div id = 'registerPanel' class = 'tabcontent'>
    <br/>
        <form action='http://localhost/Price-Arena/login.php'>
        <label for='username'>Username</label>
        <center><input type='text' class='textbox' id='username' name='username' method='get'/></center>
        <br/>
        <label for='password'>Password</label>
        <center><input type='password' class='textbox' id='password' name='password' method='get'/></center>
        <br/><br/>
        <center><input type="submit" class='submit' id='registerSubmit' name='registerSubmit' value='Register'></center>
    </form>
    <br/>
</div>
<?php
    $db = mysqli_connect("localhost:3306", "root", "", "pricearena");
    if(isset($_GET["loginSubmit"]))
    {
        $query = "CALL login('" . $_GET['username'] . "');";
        $result = mysqli_query($db, $query) or die(mysqli_error($db));
        $row = $result->fetch_assoc();
        if($row["userName"] != $_GET["username"] or !password_verify($_GET["password"], $row["pass"]))
        {
            print "
                <center>
                    <div>
                        <h3>Error: Username or password invalid!</h3>
                    </div>
                </center>";
        }
        else
        {
            $_SESSION["username"] = $_GET['username'];
            $result = mysqli_next_result($db);
            header("Location: http://localhost/Price-Arena/shop.php");
        }
    }
    elseif(isset($_GET["registerSubmit"]))
    {
        if(strlen($_GET["password"]) < 5 or strlen($_GET["username"]) < 1)
        {
            print "
                <center>
                    <div>
                        <h3>Error: Username must have at least one character and password must have at least 5!</h3>
                    </div>
                </center>";
        }
        else
        {
            $query = "CALL register('" . $_GET['username'] . "');";
            $result = mysqli_query($db, $query) or die(mysqli_error($db));
            $row = $result->fetch_assoc();
            if($row["userName"] == '')
            {
                $result = mysqli_next_result($db);
                $username = mysqli_real_escape_string($db, $_GET["username"]);
                $hash = password_hash($_GET["password"], PASSWORD_DEFAULT); 
                $query = "CALL addAccount('$username', '$hash');";
                mysqli_query($db, $query) or die(mysqli_error($db));
                $_SESSION["username"] = $_GET['username'];
                header("Location: http://localhost/Price-Arena/shop.php");
            }
            else
            {
                $result = mysqli_next_result($db);
                print "
                    <center>
                        <div class=>
                            <h3>Error: Username taken!</h3>
                        </div>
                    </center>";
            }
        }           
    }
?>
<script>
function openTab(evt, tabName) {
    var i, tabcontent, tablinks;
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) 
    {
        tabcontent[i].style.display = "none";
    }
    tablinks = document.getElementsByClassName("tablinks");
    for (i = 0; i < tablinks.length; i++) 
    {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }
    document.getElementById(tabName).style.display = "block";
    evt.currentTarget.className += " active";
}
</script> 

</body>
</html>