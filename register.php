<?php 

include "dbconnect.php";
$username=$_POST["uname"];
$email=$_POST["email"];
$address=$_POST["address"];
$password=$_POST["pass"];

$sql="INSERT INTO `users`(`id`, `username`, `email`, `address`, `password`) VALUES (null,'$username','$email','$address','$password')";
$result=mysqli_query($conn,$sql);
if ($result) {
    header("location:login.html");
} else {
    echo "something went wrong". mysqli_error($conn);
};
mysqli_close($conn);

?>


