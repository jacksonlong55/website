<?php
session_start();

$host = "localhost";
$username = "student";
$password = "CompSci364";
$database = "student";

$connection = new mysqli($host, $username, $password, $database);

if ($connection->connect_error) {
    die("Connection failed: " . $connection->connect_error);
}

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST["username"], $_POST["password"])) {
    $username = $_POST["username"];
    $password = password_hash($_POST["password"], PASSWORD_DEFAULT);

    $stmt = $connection->prepare("INSERT INTO Users (username, password_hash) VALUES (?, ?)");
    $stmt->bind_param("ss", $username, $password);
    if ($stmt->execute()) {
        echo 'success';
    } else {
        echo 'Error: ' . $connection->error;
    }
    $stmt->close();
} else {
    echo 'Invalid request';
}
?>
