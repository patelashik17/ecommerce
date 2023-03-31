<?php
 $firstname=$_POST["firstname"];
 $lastname=$_POST["lastname"];
 $email=$_POST["email"];
 $contact_info=$_POST["contact_info"];
 $address=$_POST["address"];
 $password=$_POST["password"];
 $repassword=$_POST["repassword"];

 $servername = "localhost";
 $username = "root";
 $password = "";
 $dbname = "ecomm";    

 $conn = mysqli_connect($servername , $username , $password , $dbname);

 if(!$conn)
 {
 die("Connect Failed:".mysqli_connect_error());
 }

 $sql = "INSERT INTO users (firstname,lastname,email,contact_info,address,password)
 VALUE('$firstname','$lastname','$email','$contact_info','$address','$password')";

if($password != $repassword){
    $_SESSION['error'] = 'Passwords did not match';
    header('location: signup.php');
}

 if(mysqli_query($conn,$sql))
 {
 echo "<center><h1>Thank you for registration <br> Please Wait a MINUTE...</h1></center><br>";
 echo "<center><h1>Now you can login <a href='login.php'>Login</a></h1></center>";
 }
 else
 {
 echo "Error:".$sql ."<br>" .mysqli_error($conn);
 }
 mysqli_close($conn);
?>
