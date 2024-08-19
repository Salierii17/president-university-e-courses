<?php
include "conn.php";
session_start();

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Retrieve username and password from the form
    $email = mysqli_real_escape_string($conn, $_POST["email"]);
    $password = mysqli_real_escape_string($conn, $_POST["password"]);

    // Prepare SQL statement to fetch user from database
    $sql = "SELECT * FROM users WHERE Email = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("s", $email);
    $stmt->execute();
    $result = $stmt->get_result();

    // Check if user exists and password matches
    if ($result->num_rows == 1) {
        $row = $result->fetch_assoc();
        if (password_verify($password, $row["Password"])) {
            // Authentication successful, set session variables
            $_SESSION["authenticated"] = true;
            $_SESSION["email"] = $email;

            // Redirect to a protected page
            header("Location: courses.php");
            exit;
        } else {
            // Authentication failed, display generic error message
            $error_message = "Invalid email or password!";
        }
    } else {
        // Authentication failed, display generic error message
        $error_message = "Invalid email or password!";
    }
}

// Redirect back to login page if authentication fails
header("Location: http://localhost:8080/eBusiness/webiste/pages/login.php");
exit;