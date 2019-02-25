<?php
    include '../../db/db_connection.php';
    
//    var_dump($_REQUEST);
    $conn= OpenCon();
    $email_id = mysqli_real_escape_string($conn,$_POST['email_id']);
    $password = mysqli_real_escape_string($conn,$_POST['password']);

    $select_user_query ="select * from Student where email_id='{$email_id}'";
    
    $result = mysqli_query($conn, $select_user_query);
    
    if($result){
        session_start();
        $_SESSION["w_password"] = false;
        $_SESSION["w_email"] = false;
        $count = mysqli_num_rows($result);
    
        if($count == 1){
            $row = mysqli_fetch_array($result);

            if(password_verify($password,$row['password'])){   
                $_SESSION['sid'] = session_id();
                $_SESSION['email_id'] = $email_id;
                $_SESSION['first_name'] = $row['first_name'];
                $_SESSION['last_name'] = $row['last_name'];
                $_SESSION['course'] = $row['course'];
                
                header("Location:../../templates/instructionPage.html");

            } else {
                $_SESSION["w_password"] = true;
                //  "Wrong password! Please try again.";
            }
        } else {
            $_SESSION["w_email"] = true;
            // echo "Invalid email id. Please sign up with " . $email_id ;
        }
        header('Location: ../../templates/homePage.html');
    }
    else{
        echo "Sql Error <br>";
    }
    

    

?>
