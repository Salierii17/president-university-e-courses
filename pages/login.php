<?php
include_once "conn.php"; // Include the config.php file

session_start(); // Start the session

if (isset($_SESSION['username'])) {
    header("Location: homepage.php");
    exit();
}
 
if (isset($_POST['submit'])) {
    $email = mysqli_real_escape_string($conn, $_POST['email']);
    $password = mysqli_real_escape_string($conn, $_POST['password']); // Escaping to prevent SQL injection
 
    $sql = "SELECT * FROM users WHERE Email='$email' AND Password='$password'";
    $result = mysqli_query($conn, $sql);
 
    if ($result->num_rows > 0) {
        $row = mysqli_fetch_assoc($result);
        $_SESSION['username'] = $row['Username']; // Change to Username if that's the column name
        $_SESSION['authenticated'] = true;
        header("Location: homepage.php");
        exit();
    } else {
        echo "<script>alert('Email atau password Anda salah. Silakan coba lagi!')</script>";
    }
}
?>

<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <link rel="stylesheet" href="./css/style.css">
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
                        Sign in
                    </h1>
                    <!-- Display error message if it's set -->
                    <?php if (isset($error_message)) : ?>
                        <p class="text-red-500"><?php echo $error_message; ?></p>
                    <?php endif; ?>
                    <div class="w-full flex-1 mt-8">
                        <div class="mx-auto max-w-xs">
                            <form method="POST" action="login.php">
                                <label for="email" class="sr-only">Email</label>
                                <input class="w-full px-8 py-4 rounded-lg font-medium bg-gray-100 border border-gray-200 placeholder-gray-500 text-sm focus:outline-none focus:border-gray-400 focus:bg-white" type="email" name="email" id="email" placeholder="Email" required />
                                <label for="password" class="sr-only">Password</label>
                                <input class="w-full px-8 py-4 rounded-lg font-medium bg-gray-100 border border-gray-200 placeholder-gray-500 text-sm focus:outline-none focus:border-gray-400 focus:bg-white mt-5" type="password" name="password" id="password" placeholder="Password" required />
                                <a href="register.php" class="mt-0">Register</a>
                                <button type="submit" name="submit" class="mt-5 tracking-wide font-semibold bg-indigo-500 text-gray-100 w-full py-4 rounded-lg hover:bg-indigo-700 transition-all duration-300 ease-in-out flex items-center justify-center focus:shadow-outline focus:outline-none">
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
                <div class="w-full bg-contain bg-center bg-no-repeat" style="background-image: url('\../assets/images/PU.png');">
                </div>
            </div>
        </div>
    </div>

</body>

</html>
