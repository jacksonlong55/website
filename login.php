<?php
session_start();

// Database connection credentials
$host = "localhost";
$username = "root";
$password = "root";
$database = "exercisedb";

// Establish connection
$connection = new mysqli($host, $username, $password, $database);

if ($connection->connect_error) {
    die("Connection failed: " . $connection->connect_error);
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = $_POST['username'] ?? '';
    $password = $_POST['password'] ?? '';

    if ($stmt = $connection->prepare("SELECT password_hash FROM Users WHERE username = ?")) {
        $stmt->bind_param("s", $username);
        $stmt->execute();
        $stmt->store_result();

        if ($stmt->num_rows == 1) {
            $stmt->bind_result($password_hash);
            $stmt->fetch();
            if (password_verify($password, $password_hash)) {
                $_SESSION["username"] = $username;
                echo json_encode(['authenticated' => true]);
            } else {
                echo json_encode(['authenticated' => false]);
            }
        } else {
            echo json_encode(['authenticated' => false]);
        }
        $stmt->close();
    }
    $connection->close();
}
