<?php
    include '../db/db_connection.php';
    $conn= OpenCon();
    
    $first_name = mysqli_real_escape_string($conn,$_POST['first_name']);
    $last_name = mysqli_real_escape_string($conn,$_POST['last_name']);
    $email_id = mysqli_real_escape_string($conn,$_POST['email_id']);
    $password = mysqli_real_escape_string($conn,$_POST['password']);
    $hashed_password = password_hash($password,PASSWORD_DEFAULT);
    $cpga = mysqli_real_escape_string($conn,$_POST['cgpa']);
    $dob = mysqli_real_escape_string($conn,$_POST['dob']);
    $parsed_dob = '1997-06-05';
    //TODO
    $course = mysqli_real_escape_string($conn,$_POST['course']);
    
    $insert_query = "insert into Student(first_name, last_name, email_id, password, dob, course, cgpa) values('$first_name','$last_name', '$email_id', '$hashed_password','$parsed_dob','$course', '$cgpa')";

    
    if(mysqli_query($conn,$sql)){
        echo "Successfully Registered!";
        header("Location: ../templates/homePage.html");
    }
    else {
        echo "Could not register you :(";
    }
    
    


    

?>
