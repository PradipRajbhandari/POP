<?php session_start();
require_once "include/config.php";
require_once "include/auth.php";



// you have to be logged in to view this page
// This function is in utils.php
require_login();
?>


<!DOCTYPE html>
<html>
<head>
    <title>Profile</title>
    <link rel="stylesheet" type="text/css" href="style/main.css">
</head>
<body>
	<?php include "include/nav.php"; ?>

	<div class="content">
	
	<?php 

$login_email = htmlentities(logged_in_user());

	
$email=$_SESSION['email'];

try {
$conn = mysqli_connect($DB_HOST, $DB_USER, $DB_PASSWORD, $DB_NAME);
$conn = new PDO("mysql:host=$DB_HOST;dbname=$DB_NAME", $DB_USER, $DB_PASSWORD);

$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
  } catch(PDOException $e) {
  }

// $query= "select b.title , u.*
// from boardgame as b, user as u , likes 
// where boardgame_id = b.id and user_id=u.id and u.email='ali@fed.edu.au'";

$q = "select * from user where email='".$login_email."'";
$res=$conn->query($q);
$row1= $res->fetch(PDO::FETCH_ASSOC);
$id = $row1['id']; 

$_SESSION['user_id'] = $id;


$profile_query = "select * from user where email='".$login_email."'"; 

$results =$conn->query($profile_query);



$row = $results->fetch(PDO::FETCH_ASSOC);




?>
		<table><caption><h2> Details</h2></caption>
							<center><img src="images/user/<?php echo $row['image']?>" style="width: 100px; height: 100px; border-radius: 50%;"></center>
							<tr>
								<td>Email</td>
								<td><input type="text" name="email" value="<?php echo $row['email']?>" disabled </td>
							</tr>
						
							<tr>
								<td>Full Name</td>
								<td><input type="text" name="name" value="<?php echo $row['name']?> "disabled </td>
							</tr>
							
							<tr>
								<td>Profile</td>
								<td>
								<input type="text" name="profile" value="<?php echo $row['profile']?>"disabled </td>
									
				</tr>
			

					</td>
						
						<tr>
								<td><button><a href="edit.php" style="text-decoration: none; color: black;">Edit</a></button></td>
							</tr>
						</table>
			


	
	
		<h2>Currently logged in as <?php echo htmlentities(logged_in_user()); ?></h2>
		<form action="logout.php" method="POST">
			<button>Log out</button>
		</form> 

	</div>

	<?php include "include/footer.php"; ?>

<script>
	
</script>
</body>
</html>





