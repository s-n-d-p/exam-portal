<?php
    session_start();
    if($_SESSION['sid']!=session_id()){
        header("location:homePage.html");
    }
    
    include '../../db/db_connection.php';
        
    // var_dump($_REQUEST);
    $conn= OpenCon();

    $exam_id = mysqli_real_escape_string($conn,$_POST['exam_id']);

    $exam_question_query ="select question,choices,correct from QuestionBank where exam_id='{$exam_id}'";


    $result = mysqli_query($conn,$exam_question_query);
    $total_count = mysqli_num_rows($result);

    $attempted = 0;
    $correct_answers = 0;

    $q_no = 1;
    foreach($result as $row){
        if(isset($_POST['q_no'.$q_no])){

            $attempted +=1;
            $user_answer = mysqli_real_escape_string($conn,$_POST['q_no'.$q_no]);

            if($user_answer == $row['correct']){
                $correct_answers+=1;
                echo '<p>Question '. $q_no .' answered correctly! </p>';
            } else {
                echo '<p>Question '. $q_no .' answered wrong! The correct answer was as follows:</p>';
                $choices = explode('|',$row['choices']);
                echo '<p class="correct_answer">' . $choices[$row['correct']-1].'</p>';
            }

        } else {
            
            echo '<p>Question '. $q_no .' not attempted! The correct answer was as follows:</p>';
            $choices = explode('|',$row['choices']);
            echo '<p class="correct_answer">' . $choices[$row['correct']-1].'</p>';
        }


        $q_no+=1;
    }
    echo "<h3>Attempted:" . $attempted . "</h3>";
    echo "<h3>Total marks:" . $correct_answers . "</h3>";
    

    
    $insert_query = "insert into ExamResult(id, exam_id, student_id, result) ".
                    "values('{$_SESSION['email_id']}','${exam_id}', '{$_SESSION['email_id']}', '${correct_answers}')";
    
    
    if(mysqli_query($conn,$insert_query)){
        echo "Successfully saved your results! <a href='../../templates/resultPage.html'>Go to results page</a>";
    }
    else {
        echo "Could not save results you :( <a href='../../templates/resultPage.html'>Go to results page</a>";
    }


?>