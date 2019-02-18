<?php

function OpenCon(){
	 $dbhost = "localhost";
		$dbuser="/* insert mysql username */";
		$dbpass="/*insert mysql password*/";
		$db="ExamPortal";
		$conn = new mysqli($dbhost, $dbuser, $dbpass, $db) or die("Connection failed: %s \n". $conn->error);
		return $conn;
	}
	function closecon($conn){
		$conn->close();
	}
?>