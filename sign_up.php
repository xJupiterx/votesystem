<?php
	$connection = mysqli_connect("localhost","root","");
	$db = mysqli_select_db($connection, 'votesystem');
	
	if(isset($_POST['signup']))
	{
		$firstname = $_POST['firstname'];
		$lastname = $_POST['lastname'];
		$gsuite = $_POST['gsuite'];
		$password = password_hash($_POST['password'], PASSWORD_DEFAULT);
		$filename = $_FILES['photo']['name'];
		
		$set = '123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
		$voter = substr(str_shuffle($set), 0, 15);
		
		$emailquery = "SELECT * FROM voters WHERE gsuite ='$gsuite' LIMIT 1";
		$equery = mysqli_query($connection,$emailquery);
		$user = mysqli_fetch_assoc($equery);

		if ($user > 0) {
			echo'<script> alert("Email already existing");window.location.href="index.php";</script>';
		}
		else{
			$query = "INSERT INTO voters (voters_id, password, firstname, lastname, gsuite, photo) VALUES ('$voter', '$password', '$firstname', '$lastname', '$gsuite', '$filename')";
			$query_run = mysqli_query($connection, $query);
			
			if(!empty($filename))
			{
			move_uploaded_file($_FILES['photo']['tmp_name'], '../images/'.$filename);	
			}
			
			if($query_run)
			{
				echo'<script> alert("data saved");</script>';
				header('Location:index.php');
			}
		}
	}
	else
		{
			echo'<script> alert("data not saved");</script>';
		}
?>