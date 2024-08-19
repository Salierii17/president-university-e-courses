<?php
include_once "conn.php";
session_start(); // Start the session

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Retrieve username and password from the form
    $email = $_POST["email"];
    $password = $_POST["password"];

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
            $_SESSION["email"] = $row["Email"]; // Store the email from the database

            // Redirect to a protected page
            header("Location: http://localhost:8080/eBusiness/website/pages/courses.php");
            exit;
        } else {
            // Authentication failed, display error message
            $error_message = "Invalid email or password!";
        }
    } else {
        // Authentication failed, display error message
        $error_message = "Invalid email or password!";
    }
}
?>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <link rel="stylesheet" href="../pages/css/style.css">
</head>

<body>

    <div class="min-h-screen bg-gray-100 text-gray-900 flex justify-center items-center">
        <div class="max-w-screen-xl m-0 sm:m-10 bg-white shadow sm:rounded-lg flex justify-center flex-1">
            <div class="lg:w-1/2 xl:w-5/12 p-6 sm:p-12">
                <div>
                    <img src="../assets/images/logo.png" class="w-32 mx-auto" />
                </div>
                <div class="mt-12 flex flex-col items-center">
                    <h1 class="text-2xl xl:text-3xl font-extrabold">
                        Sign Up
                    </h1>
                    <!-- Display error message if it's set -->
                    <?php if (isset($error_message)) : ?>
                        <p class="text-red-500"><?php echo $error_message; ?></p>
                    <?php endif; ?>
                    <div class="w-full flex-1 mt-8">
                        <div class="mx-auto max-w-xs">
                            <form method="POST" action="login.php">
                                <input class="w-full px-8 py-4 rounded-lg font-medium bg-gray-100 border border-gray-200 placeholder-gray-500 text-sm focus:outline-none focus:border-gray-400 focus:bg-white mt-2" type="text" name="email" id="username" placeholder="Username" />
                                <input class="w-full px-8 py-4 rounded-lg font-medium bg-gray-100 border border-gray-200 placeholder-gray-500 text-sm focus:outline-none focus:border-gray-400 focus:bg-white mt-2" type="email" name="email" id="email" placeholder="Email" />
                                <input class="w-full px-8 py-4 rounded-lg font-medium bg-gray-100 border border-gray-200 placeholder-gray-500 text-sm focus:outline-none focus:border-gray-400 focus:bg-white mt-2" type="password" name="password" id="password" placeholder=" Confirm Password" />
                                <input class="w-full px-8 py-4 rounded-lg font-medium bg-gray-100 border border-gray-200 placeholder-gray-500 text-sm focus:outline-none focus:border-gray-400 focus:bg-white mt-2" type="password" name="confirmpassword" id="password" placeholder="Password" />
                                <button type="submit" class="mt-5 tracking-wide font-semibold bg-indigo-500 text-gray-100 w-full py-4 rounded-lg hover:bg-indigo-700 transition-all duration-300 ease-in-out flex items-center justify-center focus:shadow-outline focus:outline-none">
                                    <svg class="w-6 h-6 -ml-2" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                        <path d="M16 21v-2a4 4 0 00-4-4H5a4 4 0 00-4 4v2" />
                                        <circle cx="8.5" cy="7" r="4" />
                                        <path d="M20 8v6M23 11h-6" />
                                    </svg>
                                    <span class="ml-3">
                                        Sign in
                                    </span>
                                </button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="flex-1 bg-indigo-100 text-center hidden lg:flex">
                <div class="w-full  bg-center bg-no-repeat" style="background-image: url('\../assets/images/PU.png');">
                </div>
            </div>
        </div>
    </div>

</body>

</html>