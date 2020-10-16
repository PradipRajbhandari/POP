<?php
	require_once "include/config.php";
	require_once "include/auth.php";
	//New User Data
	$quantity = $_POST['quantity'];
	$price = $_POST['unit']; 
	$item = $_POST['item'];
    $product_id = $_POST['product_id'];

    $supplier_id = $_POST['supplier_id'];
    $address = $_POST['address'];
    $contact = $_POST['contact'];
    $email = $_POST['email'];
	$date = $_POST['date'];
	$order_id = rand();	

	//Purchase_order

	$con = mysqli_connect($DB_HOST, $DB_USER, $DB_PASSWORD, $DB_NAME);

	$getsupplier_query = "SELECT name FROM supplier WHERE Id='$supplier_id'";

	$getsupplier_result = mysqli_query($con, $getsupplier_query);

	if ($getsupplier_result->num_rows > 0) {
		// output data of each row
		while($row = $getsupplier_result->fetch_assoc()) {
		//   echo $row["name"];
		  $supplier_name = $row["name"];
		}
	  } else {
		// echo "0 results";
	  }


	$purchase_query = "INSERT INTO drafts 
	(order_id, supplier_id,supplier_name, purchase_date, purchase_address, contact, email, is_approved, is_reject, is_waiting ) VALUES ('$order_id','$supplier_id','$supplier_name','$date','$address','$contact','$email','0','0','1');";

	$purchase_result = mysqli_query($con, $purchase_query);
			if($purchase_result){
			// echo "New order added"."<br>";
			}else{
				// echo "<br>"."Something went wrong";
			}


		//Purchase_order
		
		for ($i=0; $i < count($quantity); $i++) { 

			$total = ( number_format($quantity[$i]) * number_format($price[$i]) ); 
			// print_r($total);

				$processorder_query = "INSERT INTO process_order (order_id, supplier_id, quantity, item, price, total ) VALUES ('$order_id','$supplier_id','$quantity[$i]','$item[$i]','$price[$i]','$total');";

				$processorder_result = mysqli_query($con, $processorder_query);
				if($processorder_result){
						// echo "New process order added"."<br>";
				}else{
						// echo "<br>"."Something went wrong";
				}
		}

$total = array();
foreach ($price as $key=>$price1) {
    $total[] = $price1 * $quantity[$key];
}

echo array_sum($total);


    ?>



