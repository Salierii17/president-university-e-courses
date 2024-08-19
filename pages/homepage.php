<?php
session_start(); // Start the session

// Include your database connection file here
include_once "conn.php";

// Check if the user is authenticated
$authenticated = isset($_SESSION["authenticated"]) && $_SESSION["authenticated"];

// Initialize user name variable
$userName = "";

// If user is authenticated, fetch the user's name from the session
if ($authenticated) {
    // Fetch the user's name from the session
    $userName = $_SESSION['username'];
}
?>

<!-- Understanding the HTML Elements as Boxes Will make super easy for you to build complex Layouts as a beginner -->
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Store</title>
    <style>
        .dropdown-menu {
            display: none;
            position: absolute;
            background-color: #fff;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            padding: 10px;
            border-radius: 5px;
            z-index: 999;
            /* Ensure the dropdown is on top */
        }

        .profile-dropdown {
            position: relative;
            /* Ensure the dropdown is positioned relative to the parent */
            z-index: 9999;
            /* Set a high z-index value to ensure it appears above other elements */
        }

        /* Show the dropdown menu when hovering over profile icon */
        .profile-dropdown:hover .dropdown-menu {
            display: block;

        }
    </style>
    <!--========= Custom Css ======== -->
    <link rel="stylesheet" href="./css/homepage.css">
    <link href="../pages/css/style.css" rel="stylesheet">
    <link rel="stylesheet" href="../node_modules/bootstrap-icons/font/bootstrap-icons.css">

</head>

<body>
    <!-- ==== Header Section === -->
    <header class="header">
        <div class="container">
            <!-- Navbar -->
            <nav class="navbar">
                <div class="brand">
                    <img src="../assets/images/homepage/logo.png" alt="">
                </div>
                <!-- Navigation links -->
                <ul class="navlinks">
                    <li><a href="#">Home</a></li>
                    <li><a href="filter2.php">Courses</a></li>
                    <li><a href="#">Lectures</a></li>
                    <li><a href="full.php">Get Pro</a></li>
                    <?php if ($authenticated) : ?>
                        <!-- Profile dropdown -->
                        <li class="profile-dropdown" onmouseover="showCard()" onmouseout="hideCard()">
                            <a href="#" class="text-decoration-none">
                                <span class="bi bi-person fs-4" style="font-size: 24px;"></span>
                            </a>
                            <img id="profileImage" class="hidden block mx-auto h-12 rounded-full sm:mx-0 sm:shrink-0" src="https://tailwindcss.com/img/erin-lindford.jpg" alt="User Profile">
                            <div id="profileDetails" class="hidden text-center space-y-2 sm:text-left">
                                <div class="space-y-0.5">
                                    <p id="profileName" class="text-base text-black font-semibold">
                                        <?php echo $userName; ?>
                                    </p>
                                    <!-- Free account color ideas
                                    Light blue (#3498db)
                                    Mint green (#2ecc71)
                                    Sky blue (#87ceeb)

                                    Pro account color ideas
                                    Dark gray (#333333)
                                    Royal purple (#x)
                                    Gold (#ffd700) -->

                                    <p id="profileRole" class="text-slate-500 font-medium text-xs" style="color: #3498db;">
                                        Free Account/Pro Account
                                    </p>
                                </div>
                                <button id="profileMessageBtn" onclick="logout()" class="px-3 py-1 text-xs text-red-600 font-semibold rounded-full border border-purple-200 hover:text-white hover:bg-purple-600 hover:border-transparent focus:outline-none focus:ring-2 focus:ring-purple-600 focus:ring-offset-2">Log Out</button>
                            </div>
                        </li>
                    <?php else : ?>
                        <li><a href="login.php">Sign in</a></li>
                    <?php endif; ?>
                </ul>
            </nav>

            <!-- Menu button to toggle Mobile Menu -->
            <a class="menuBtn" href="#"><img src="../assets/images/homepage/menu.png" alt=""></a>

            <!-- Header Content -->
            <div class="header-content">
                <div class="header-info">
                    <div class="line"></div>
                    <h3>Welcome to</h3>
                    <h1>President University E-COURSES </h1>
                    <p>President University E-Learning creates fully online courses that learners can take from anywhere in the world
                        Start vour certificate today.
                    <p>
                        <button class="ctn">Lean More &#8594;</button>
                </div>
                <div class="header-img">
                    <img src="../assets/images/homepage/main.png" alt="">
                </div>
            </div>
        </div>
    </header>

    <!-- ==== Category  Section ==== -->
    <section class="container" id="categories">
        <div class="category">
            <img src="../assets/images/homepage/gambar1.jpg" alt="">
            <div class="category-content">
                <p>you interested</p>
                <h3>Information System</h3>
            </div>
        </div>

        <div class="category">
            <div class="category-content">
                <p>What are you</p>
                <h3>interested in?</h3>
            </div>
            <img src="../assets/images/homepage/gambar2.jpg" alt="">
        </div>

        <div class="category">
            <img src="../assets/images/homepage/gambar3.jpg" alt="">
            <div class="category-content">
                <p>you interested</p>
                <h3>Management</h3>
            </div>
        </div>
    </section>

    <!-- ===== Featured Products ======= -->
    <section class="container" id="featured-products">
        <div class="section-info">
            <h1>Trending courses</h1>
            <div class="line"></div>
        </div>
        <div class="products">
            <div class="product">
                <img src="../assets/images/homepage/major2.jpg" alt="">
                <div class="product-info">
                    <p>Information System</p>
                    <h5>Understand information system to optimize procesess</h5>
                    <h5>&#9733; &#9733; &#9733; &#9733; &#9734;</h5>
                </div>
            </div>

            <div class="product">
                <img src="../assets/images/homepage/major1.jpg" alt="">
                <div class="product-info">
                    <p>Management Organizational Behavior </p>
                    <h5>Explore the MOB to enhance Organizationaleffectiveness</h5>
                    <h5>&#9733; &#9733; &#9733; &#9733; &#9734;</h5>
                </div>
            </div>
            <div class="product">
                <img src="../assets/images/homepage/major3.jpg" alt="">
                <div class="product-info">
                    <p>Web Design</p>
                    <h5>Create websites that effectively communicate information</h5>
                    <h5>&#9733; &#9733; &#9733; &#9733; &#9734;</h5>
                </div>
            </div>
            <div class="product">
                <img src="../assets/images/homepage/major4.jpg" alt="">
                <div class="product-info">
                    <p>Management</p>
                    <h5>teachs various skill and concepts</h5>
                    <h5>&#9733; &#9733; &#9733; &#9733; &#9734;</h5>
                </div>
            </div>
        </div>

    </section>

    <!--============  Offer ==============-->
    <section id="offer">
        <div class="container">
            <img src="../assets/images/homepage/offer.png" alt="">
            <div class="offer-content">
                <div class="line"></div>
                <h1>Learner <br> Testimonials</h1>
                <p>Introduction to Information System

                    "The introduction to information subject provided valuable insights into the evolving landscape of data privacy and technological advancements, emphasizing the importance of safeguarding privacy while fostering innovation.

                    Through engaging discussions and guidance from instructors, the course encouraged critical thinking, expanding our comprehension of data privacy issues. Ultimately, it underscored the necessity for a widespread cultural shift towards the ethical utilization of technology
                    Jonnica Nagaba</p>
            </div>
        </div>
    </section>

    <!-- ============ Footer =============== -->

    <footer>
        <div class="footer-content container">
            <div class="col">
                <img src="../assets/images/homepage/logopresident.png" alt="">
                <p>President University
                    E-Course</p>
            </div>

            <div class="col">
                <h3>Company</h3>
                <ul>
                    <li>Home</li>
                    <li>About</li>
                    <li>All Major</li>
                    <li>Contact</li>
                </ul>
            </div>

            <div class="col">
                <h3>Business</h3>
                <ul>
                    <li>Project</li>
                    <li>Our Team</li>
                    <li>Affilate</li>
                    <li>Customers</li>
                </ul>
            </div>

            <div class="col">
                <h3>Get in Touch</h3>
                <ul>
                    <li>infoPresidentUniversity</li>
                    <li>1-090-999999</li>
                    <li>Indonesia</li>
                </ul>
            </div>
        </div>
        <div class="copyright container">
    </footer>

    <!-- ============== Javascript for Mobile Menu =========== -->
    <script>
        const menuBtn = document.querySelector('.menuBtn')
        const navlinks = document.querySelector('.navlinks')

        menuBtn.addEventListener('click', () => {
            navlinks.classList.toggle('active');
        })

        // document.addEventListener("DOMContentLoaded", function() {
        //     const dropdownToggles = document.querySelectorAll(".profile-dropdown");

        //     dropdownToggles.forEach(function(toggle) {
        //         toggle.addEventListener("mouseenter", function() {
        //             const dropdownMenu = this.querySelector(".dropdown-menu");
        //             dropdownMenu.style.display = "block";
        //         });

        //         toggle.addEventListener("mouseleave", function() {
        //             const dropdownMenu = this.querySelector(".dropdown-menu");
        //             dropdownMenu.style.display = "none";
        //         });
        //     });
        // });
    </script>
    <script>
        // Function to show the profile details
        function showCard() {
            document.getElementById("profileImage").classList.remove("hidden");
            document.getElementById("profileDetails").classList.remove("hidden");
            document.getElementById("profileName").classList.remove("hidden");
            document.getElementById("profileRole").classList.remove("hidden");
            document.getElementById("profileMessageBtn").classList.remove("hidden");
        }

        // Function to hide the profile details
        function hideCard() {
            document.getElementById("profileImage").classList.add("hidden");
            document.getElementById("profileDetails").classList.add("hidden");
            document.getElementById("profileName").classList.add("hidden");
            document.getElementById("profileRole").classList.add("hidden");
            document.getElementById("profileMessageBtn").classList.add("hidden");
        }

        // Close the profile details when clicking outside the profile dropdown
        window.addEventListener('click', function(event) {
            const profileDropdown = document.querySelector('.profile-dropdown');
            if (event.target !== profileDropdown) {
                hideCard();
            }
        });

        function logout() {
            window.location.href = "logout.php";
        }
    </script>

</body>

</html>