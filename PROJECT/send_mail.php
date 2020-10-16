
<?php
    $email = file_get_contents("generate_bill.php");
    email=str_replace("{{coupon_code}}","1234567",$email)
    echo $email;
?>