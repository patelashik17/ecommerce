<?php
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require 'vendor/PHPMailer/src/Exception.php';
require 'vendor/PHPMailer/src/PHPMailer.php';
require 'vendor/PHPMailer/src/SMTP.php';
$mail = new PHPMailer;

include 'includes/session.php';

if (isset($_POST['signup'])) {
	$firstname = $_POST['firstname'];
	$lastname = $_POST['lastname'];
	$email = $_POST['email'];
	$password = $_POST['password'];
	$repassword = $_POST['repassword'];

	$_SESSION['firstname'] = $firstname;
	$_SESSION['lastname'] = $lastname;
	$_SESSION['email'] = $email;

	if ($password != $repassword) {
		$_SESSION['error'] = 'Passwords did not match';
		header('location: signup.php');
	} else {
		$conn = $pdo->open();

		$stmt = $conn->prepare("SELECT COUNT(*) AS numrows FROM users WHERE email=:email");
		$stmt->execute(['email' => $email]);
		$row = $stmt->fetch();
		if ($row['numrows'] > 0) {
			$_SESSION['error'] = 'Email already taken';
			header('location: signup.php');
		} else {
			$now = date('Y-m-d');
			$password = password_hash($password, PASSWORD_DEFAULT);

			//generate code
			$set = '123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
			$code = substr(str_shuffle($set), 0, 12);

			try {
				$stmt = $conn->prepare("INSERT INTO users (email, password, firstname, lastname, activate_code, created_on) VALUES (:email, :password, :firstname, :lastname, :code, :now)");
				$stmt->execute(['email' => $email, 'password' => $password, 'firstname' => $firstname, 'lastname' => $lastname, 'code' => $code, 'now' => $now]);
				$userid = $conn->lastInsertId();

				$message = "
						<h2>Thank you for Registering.</h2>
						<p>Your Account:</p>
						<p>Email: " . $email . "</p>
						<p>Password: " . $_POST['password'] . "</p>
						<p>Please click the link below to activate your account.</p>
						<a href='http://localhost:8880/ashik/Ecommerce%20Site%20PHP/ecommerce/activate.php?code=" . $code . "&user=" . $userid . "'>Activate Account</a>
					";



				$mail->isSMTP();
				$mail->Host = 'smtp.gmail.com';
				$mail->SMTPAuth = true;
				$mail->Username = 'patelbhai1714@gmail.com';
				$mail->Password = 'wgomscsshpcckhts';
				$mail->SMTPSecure = 'tls';
				$mail->Port = 587;
				$mail->setFrom('patelbhai1714@gmail.com', 'ashik');
				$mail->addAddress($email);
				$mail->addReplyTo('patelbhai1714@gmail.com');

				$mail->isHTML(true);
				$mail->Subject = 'Login code';

				$mailContent = $message;

				$mail->Body = $mailContent;
				$mail->send();

				if (!$mail->send()) {
					echo 'Message could not be sent.';
					echo 'Error: ' . $mail->ErrorInfo;
				} else {
					echo 'Message has been sent';
					header('location: login.php');
				}



			} catch (PDOException $e) {
				$_SESSION['error'] = $e->getMessage();
				header('location: register.php');
			}

			$pdo->close();

		}

	}

} else {
	$_SESSION['error'] = 'Fill up signup form first';
	header('location: signup.php');
}

?>