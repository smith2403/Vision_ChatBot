<?php
include 'dbconnect.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Retrieve form data
    $username = $_POST['uname'];
    $password = $_POST['pass'];

    // SQL query to retrieve user data based on the provided username and password
    $sql = "SELECT * FROM `users` WHERE `username` = ? AND `password` = ?";

    // Prepare the statement
    $stmt = $conn->prepare($sql);

    // Bind parameters and execute the statement
    $stmt->bind_param("ss", $username, $password);
    $stmt->execute();

    // Get the result
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        // User found, login successful
        header("Location: index.html");
        // You can redirect the user to a dashboard or home page after successful login
    } else {
        // User not found or incorrect password
        echo "Incorrect username or password";
    }

    // Close the statement
    $stmt->close();
}

// Close the database connection
$conn->close();
?>
