<?php
    include '../../db/db_connection.php';
    $conn= OpenCon();

    $first_name = mysqli_real_escape_string($conn,$_POST['first_name']);
    $last_name = mysqli_real_escape_string($conn,$_POST['last_name']);
    $email_id = mysqli_real_escape_string($conn,$_POST['email_id']);
    $password = mysqli_real_escape_string($conn,$_POST['password']);
    $hashed_password = password_hash($password,PASSWORD_DEFAULT);
    $cgpa = mysqli_real_escape_string($conn,$_POST['cgpa']);
    $dob = mysqli_real_escape_string($conn,$_POST['dob']);
    $course = mysqli_real_escape_string($conn,$_POST['course']);
    
    $insert_query = "insert into Student(first_name, last_name, email_id, password, dob, course, cgpa) values('{$first_name}','${last_name}', '${email_id}', '${hashed_password}','${dob}','${course}', '${cgpa}')";
    
    //echo $insert_query;
    
    session_start();
    if(mysqli_query($conn,$insert_query)){

        $_SESSION['registered'] = true;
    }
    else {

        $_SESSION['registered'] = false;
    }

    header("Location: ../../templates/homePage.html");
    

?>
