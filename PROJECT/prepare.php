
<?php session_start();
require_once "include/config.php";
require_once"include/auth.php";
require_login();

?>
<! DOCTYPE html>
<html>
<head>
<title> POP</title>
<link rel="stylesheet" type="text/css" href="style/main.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>

</head>

<body>
<?php include "include/nav.php"; ?>

	<div class="content">

		<h1>Welcome </h1>
	<?php
		$login_email = htmlentities(logged_in_user());

	
$email=$_SESSION['email'];

try {
$conn = mysqli_connect($DB_HOST, $DB_USER, $DB_PASSWORD, $DB_NAME);
$conn = new PDO("mysql:host=$DB_HOST;dbname=$DB_NAME", $DB_USER, $DB_PASSWORD);

$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
  } catch(PDOException $e) {
  }


$profile_query = "select * from supplier "; 

$results =$conn->query($profile_query);

$row = $results->fetch(PDO::FETCH_ASSOC);

?>

<!-- action="_prepare.php" enctype="multipart/form-data" id ="cakeform" -->
	<form method="POST">
<label for="Supplier" >Choose Supplier:</label>


<select name="supplier"  id="supplier" onchange="getSupplier(this.options[this.selectedIndex].value)">
	<option selected>Select</option>
	<option value="1">ABC</option>
	<option value="2">xyz</option>
	<option value="3">prb</option>
	</select>
	<br><br>
	Date : <input type="date" name="date" required>
	<br><br>
	
	address : <input  type="address" name="address" value="" id="address" required>
	<br><br>
	contact : <input type="contact" value="" name="contact" id="contact" required>
	<br><br>
	email : <input  type="email" value="" name="email" id="email" required>
	
	<br><br>
	<input type="hidden" name="supplier_id" value="" id="supplier_id">

	<table border="solid 1px white" id="listoforder">
	<thead>
		<th>quantity</th>
		<th>item name</th>
		<th>unit price</th>

	</thead>

	<tbody>
		<tr id="orderList">
				<td>
					<input type="text" name="quantity" value=" -- " required id="quantity" readonly>
				</td>
				<td>
					<input type="name" name="item" value=" -- " required readonly>
				</td>
				<td>
					<input type="number" name="unit" value=" -- " required readonly>
				</td>
				
		</tr>
	</tbody>
	</table>
	
	<br>
	<input type="submit" name="submit" value="Prepare" style="color: white;background: blue;margin-left: 41%;">

	<br><br>
	<h3 style="color:red;text-align:center" id="total"></h3>

</div>
</form>

<button  id="draft" style="color: white;background: green;margin-left: 44%;" onclick="saveToDraft()">Save  to Drafts</button>

<?php include "include/footer.php";?>
<script>

	//In the javascript code
var theForm = document.forms["cakeform"];

function getQuantity()
{
    //Assume form with id="theform"
    var theForm = document.forms["cakeform"];
    //Get a reference to the TextBox
    var quantity = theForm.elements["quantity"];
    var howmany =0;
    //If the textbox is not blank
    if(quantity.value!="")
    {
        howmany = parseInt(quantity.value);
    }
return howmany;
}

function saveToDraft(){
// var data = $('form').serialize();
// console.log(data);

$.ajax({
  type: 'post',
  url: 'post_to_drafts.php',
  data: $('form').serialize(),
  success: function (result) {
	  alert('Save to draft Successfully');
  }
});

}


function getSupplier(value){
	$("#total").text('');

	$("#listoforder tbody").empty();

	var selectedValue = value
	$.ajax({
			url:"get_supplier.php",    //the page containing php script
			dataType: "json",
            type: "post",    //request type,
            data: {selected: selectedValue},
            success:function(result){
				console.log(result);


				for(var i=0; i<result.length; i++){
                var title = result[i].title;
				var product_id = result[i].Id
					var tr_str = '';

                    tr_str = "<tr  id='orderList'>" +
                    "<td><input type='number' name='quantity[]' required='true' id='quantity'></td>" +
                    "<td><input type='text' name='item[]' value='"+title+"' required='true' ></td>" +
                    "<td><input type='number' name='unit[]' required='true' ></td>" +
                    "<td style='display:none'><input type='hidden' value='"+product_id+"' name='product_id[]'></td>" +
                    "</tr>";

                $("#listoforder tbody").append(tr_str);
            }
			}	
		});


		$.ajax({
			url:"get_supplier_details.php",    //the page containing php script
			dataType: "json",
            type: "post",    //request type,
            data: {selected: selectedValue},
            success:function(result){
				console.log(result);

				var address = result.address;
				$("#address").val(address);
				var email = result.email;
				$("#email").val(email);
				var contact = result.contact;
				$("#contact").val(contact);
				var id = result.id;
				$("#supplier_id").val(id);
			}	
		});


}




$('form').on('submit', function (e) {

  e.preventDefault();

  $.ajax({
	type: 'post',
	url: 'post_to_admin.php',
	data: $('form').serialize(),
	success: function (result) {
		console.log('total-- > '+ result);
		$("#total").text('Total - '+ result);
		alert('Request Submitted Successfully');
	}
  });

});


</script>
</body>
</html>