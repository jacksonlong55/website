<?php
// Database connection credentials
$host = "localhost";
$username = "your_username";
$password = "your_password";
$database = "your_database";

// Establish connection
$connection = mysqli_connect($host, $username, $password, $database);

// Check connection
if (!$connection) {
    die("Connection failed: " . mysqli_connect_error());
}

// Query to fetch user information (assuming you already have the user's ID)
$userID = 1; // Change this to the actual user's ID
$query = "SELECT * FROM User_Profile WHERE UserID = $userID";
$result = mysqli_query($connection, $query);

// Fetch user information
$user = mysqli_fetch_assoc($result);

// Close connection
mysqli_close($connection);
?>