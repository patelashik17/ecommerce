<?php
        $conn=mysqli_connect("localhost","root","","ecomm");
        if($conn==false){
            echo("connection error".mysqli_connect_error());
        }
        else{
            echo("yes");
        }
        $email=$_POST['email'];
        $sql="INSERT INTO subscriber(email) VALUES('$email')";

        if(mysqli_query($conn,$sql)){
            
                echo "You Become subscriber";
        }
        else{
            echo "error";
        }
        mysqli_close($conn);
?>
