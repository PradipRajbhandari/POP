

<?php session_start();
require_once "include/config.php";
require_once"include/auth.php";
?>
<! DOCTYPE html>
<html>
<head>
<title> Assignment</title>
<link rel="stylesheet" type="text/css" href="style/main.css">
</head>
<body>
<?php include "include/nav.php"; ?>

<div class="content">
<form method ="post" action="createuser.php">
<table>


<tr>

<td> Name </td> <td> <input type="text" name="name" required></td>
</tr>
<tr> 
<td> Email </td> <td> <input type="text" name="email" required></td>
</tr>
<tr>

<td> Password </td> <td> <input type="password" name="password" required></td>

</tr>
<tr>
<td> Profile </td> <td> 
<input type="radio" name="profile" value="Admin"> Admin
<input type="radio" name="profile" value="User">User 
</tr>
</tr>

<td> </td> <td><input type ="submit" name="go"  value="sign-up"> </td>
</tr>
</form>
</div>
<?php include "include/footer.php";?>
<script>
</script>
</body>
</html>