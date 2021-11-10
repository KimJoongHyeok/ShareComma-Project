<?php
mb_internal_encoding("UTF-8");

$to = 'email@example.com';
$subject = 'Message from Craigs';

$name = "";
$email = "";
$phone = "";
$message = "";

if( isset($_POST['name']) ){
    $name = $_POST['name'];

    $body .= "Name: ";
    $body .= $name;
    $body .= "\n\n";
}
if( isset($_POST['subject']) ){
    $subject = $_POST['subject'];
}
if( isset($_POST['email']) ){
    $email = $_POST['email'];

    $body .= "";
    $body .= "Email: ";
    $body .= $email;
    $body .= "\n\n";
}
if( isset($_POST['phone']) ){
    $phone = $_POST['phone'];

    $body .= "";
    $body .= "Phone: ";
    $body .= $phone;
    $body .= "\n\n";
}
if( isset($_POST['message']) ){
    $message = $_POST['message'];

    $body .= "";
    $body .= "Message: ";
    $body .= $message;
    $body .= "\n\n";
}

/* Example of newsletter fields */

if( isset($_POST['newsletter_category']) ){
    $subject = 'Newsletter subscriber from Craigs';
    $category = $_POST['newsletter_category'];

    $body .= "";
    $body .= "Category: ";
    $body .= $category;
    $body .= "\n\n";
}
if( isset($_POST['newsletter_email']) ){
    $email = $_POST['newsletter_email'];

    $body .= "";
    $body .= "Email: ";
    $body .= $email;
    $body .= "\n\n";
}

/* End of example */

$headers = 'From: ' .$email . "\r\n";

if (filter_var($email, FILTER_VALIDATE_EMAIL)) {
mb_send_mail($to, $subject, $body, $headers);
    echo '<div class="status-icon valid"><i class="fa fa-check"></i></div>';
}
else{
    echo '<div class="status-icon invalid"><i class="fa fa-times"></i></div>';
}
