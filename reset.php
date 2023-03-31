<?php
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require 'vendor/PHPMailer/src/Exception.php';
require 'vendor/PHPMailer/src/PHPMailer.php';
require 'vendor/PHPMailer/src/SMTP.php';
$mail = new PHPMailer;

include 'includes/session.php';

if (isset($_POST['reset'])) {
	$email = $_POST['email'];

	$conn = $pdo->open();

	$stmt = $conn->prepare("SELECT *, COUNT(*) AS numrows FROM users WHERE email=:email");
	$stmt->execute(['email' => $email]);
	$row = $stmt->fetch();

	if ($row['numrows'] > 0) {
		$set = '123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
		$code = substr(str_shuffle($set), 0, 15);
		try {
			$stmt = $conn->prepare("UPDATE users SET reset_code=:code WHERE id=:id");
			$stmt->execute(['code' => $code, 'id' => $row['id']]);

			$message = "
					<h2>Password Reset</h2>
					<p>Your Account:</p>
					<p>Email: " . $email . "</p>
					<p>Please click the link below to reset your password.</p>
					<a href='http://localhost:8880/ashik/Ecommerce%20Site%20PHP/ecommerce/password_reset.php?code=" . $code . "&user=" . $row['id'] . "'>Reset Password</a>
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
			$mail->Subject = 'Password Reset code';

			$mailContent = $message;

			$mail->Body = $mailContent;
			$mail->send();

			if (!$mail->send()) {
				echo 'Message could not be sent.';
				echo 'Error: ' . $mail->ErrorInfo;
			} else {
				echo 'Message has been sent';
				header('location: password_forgot.php');
			}
		} catch (PDOException $e) {
			$_SESSION['error'] = $e->getMessage();
		}
	} else {
		$_SESSION['error'] = 'Email not found';
	}

	$pdo->close();

} else {
	$_SESSION['error'] = 'Input email associated with account';
}

header('location: password_forgot.php');

?>