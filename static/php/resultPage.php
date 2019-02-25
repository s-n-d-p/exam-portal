
<html>
    <head>

            <link rel="stylesheet" href="../../static/css/bootstrap/bootstrap.css" />
            <link rel="stylesheet" href="../../static/css/styles.css" />
            <link rel="icon" href="../../static/images/icon.jpg" />
            <title>Results | Exam Portal</title>
    </head>
    <body>
        
            <div class="container-fluid text-white font-weight-bold">
                    <div class="row" style="border-bottom: solid">
                            <div class="col-lg-9"></div>
                            <div class="col-lg-3 text-right">
                                <a href="./logoutPage.html" class="btn btn-link">Logout</a>
                            </div>
                        </div>
                <div class="row">
                    
                <div class="col">
                <?php
                    session_start();
                    if($_SESSION['sid']!=session_id()){
                        header("location:homePage.html");
                    }
                    
                    include '../../db/db_connection.php';
                        
                    //var_dump($_REQUEST);
                    $conn= OpenCon();

                    $exam_id = mysqli_real_escape_string($conn,$_POST['exam_id']);

                    $exam_question_query ="select question,choices,correct from QuestionBank where exam_id='{$exam_id}'";


                    $result = mysqli_query($conn,$exam_question_query);
                    $total_count = mysqli_num_rows($result);

                    $attempted = 0;
                    $correct_answers = 0;

                    $q_no = 1;
                    $return .= '<table class="table">
                                <thead>
                                    <tr>
                                        <th>Question</th>
                                        <th>Attempted?</th>
                                        <th>Your Answer</th>
                                        <th>Correct Answer</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>';
                    foreach($result as $row){
                        $return .= "<tr>" .
                                        "<td>".
                                            $q_no .
                                        "</td>"
                                    ;
                        $choices = explode('|',$row['choices']);

                        $tick = false;
                        if(isset($_POST['q_no'.$q_no])){

                            $return .= "<td> Yes </td>";
                            $attempted +=1;
                            $user_answer = mysqli_real_escape_string($conn,$_POST['q_no'.$q_no]);

                            if($user_answer == $row['correct']){
                                $correct_answers+=1;
                                $tick = true;
                            }

                            $return .=  "<td>" .
                                    $choices[$user_answer-1].
                                "</td>";     
                            
                        } else {
                            $return .= "<td> No </td>";

                            $return .=  "<td>" .
                                    "N/A".
                                "</td>";     
                        }
                // Your answer   
                        $return .=  "<td>" .
                                        $choices[$row['correct']-1].
                                    "</td>";

                        if($tick){
                            $pic = "✅";
                        } else {
                            $pic = "❌";
                        }
                        $return .= "<td>".
                                        $pic.
                                    "</td>";
                        $return .= "</tr>";
                        $q_no+=1;
                    }

                    echo $return .  "
                            </tbody>
                        </table>
                    </div></div>
                        " ; 

                    echo "<div class='row'>
                            <div class='col'>
                            <p class='dark'>
                            Attempted: " . $attempted . "</p>";
                    echo "<p class='dark'>Total marks: " . $correct_answers . " out of $total_count.</p>";
                    

                    
                    $insert_query = "REPLACE into ExamResult(id, exam_id, student_id, result) ".
                                    "values('{$_SESSION['email_id']}".$exam_id."','${exam_id}', '{$_SESSION['email_id']}', '${correct_answers}')";
                    
                    echo $insert_query;
                    if(mysqli_query($conn,$insert_query)){
                        echo "<br><p class='green'>Successfully saved your results! </p><a href='../../templates/resultPage.html'>Go to results page</a>";
                    }
                    else {
                        echo "<br><p class='red'>Could not save your results :( </p><a href='../../templates/resultPage.html'>Go to results page</a>";
                    }
                    echo "</div></div>";
                ?>
                </div>
        </div>

    </body>
</html>