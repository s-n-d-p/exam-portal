<?php
    include '../../db/db_connection.php';
    
//    var_dump($_REQUEST);
    $conn= OpenCon();
    $email_id = mysqli_real_escape_string($conn,$_POST['email_id']);
    $password = mysqli_real_escape_string($conn,$_POST['password']);

    $select_user_query ="select password, first_name from Student where email_id='{$email_id}'";
    
    $result = mysqli_query($conn, $select_user_query);
    
    if($result){
        $count = mysqli_num_rows($result);
    
        if($count == 1){
            $row = mysqli_fetch_array($result);

            if(password_verify($password,$row['password'])){   
                session_start();
                $_SESSION['sid'] = session_id();
                $_SESSION['email_id'] = $email_id;
                $_SESSION['first_name'] = $row['first_name'];
                
                header("Location:../../templates/instructionPage.html");
               // echo "Thanks for loggin in, " . $row['first_name'];

            } else {
                echo "Wrong password! Please try again.";
            }
        } else {
            echo "Invalid email id. Please sign up with " . $email_id ;
        }
    }
    else{
        echo "Sql Error <br>";
    }
    

    

?>
