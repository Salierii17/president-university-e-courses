<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>President University E-Course</title>
    <link rel="stylesheet" href="./css/filter.css">
</head>

<body>
    <!-- Including PHP script to establish database connection -->
    <?php include "../conn.php" ?>
    <!-- Main page container -->
    <main class="page-container">
        <!-- Header section -->
        <header class="header">
            <!-- Logo and site title -->
            <img src="./img/filter/site_logo.png" alt="Logo" class="logo">
            <div class="site-title">
                <img src="./img/filter/presuniv_logo.png" alt="PU Logo" class="site-logo">
                <div class="site-name">
                    <span>President University</span>
                    <span>E-Course</span>
                </div>
            </div>
            <!-- Search bar -->
            <div class="search-container">
                <form class="search-bar">
                    <img src="./img/filter/search_icon.png" alt="Search Icon" class="search-icon">
                    <input type="text" id="search-input" placeholder="Search" class="search-text">
                </form>
            </div>
        </header>
        <!-- Page title -->
        <h1 class="page-title">Courses</h1>

        <?php
        // Define array of filter items
        $filterItems = array(
            // Define filter categories and their options
            "Major" => array(
                "Faculty of Business" => array("Accounting", "Business Administration", "Management", "Actuarial Science"),
                "Faculty of Engineering" => array("Civil Engineering", "Industrial Engineering", "Mechanical Engineering", "Electrical Engineering", "Environmental Engineering"),
                "Faculty of Computer Science" => array("Information Technology", "Information System", "Visual Communication Design", "Interior Design"),
                "Faculty of Humanities" => array("International Relations", "Communication", "Law", "Primary School Teacher Education")
            ),
            "Price" => array("Free", "Paid"),
            "Start Date" => array("Available Now", "Within Next Week", "Within Next Month", "Within Next 3 Month", "Within Next 6 Month", "Within Next Year", "Available Anytime"),
            "Duration" => array("0 to 1 Week", "1+ to 2 Weeks", "2+ to 4 Weeks", "4+ to 6 Weeks", "6+ to 8 Weeks", "8+ to 12 Weeks", "12+ Weeks"),
            "Difficulty" => array("Beginner", "Intermediate", "Advanced")
        );
        ?>
        <!-- Filter options -->
        <div class="wrapper">
            <ul>
                <?php
                // Iterate through filter items and create list items
                foreach ($filterItems as $filter => $subFilters) {
                     // Create list items for each filter category and its options
                    echo "<li>$filter";
                    echo "<ul>";
                    // Check if the current filter is "Major"
                    if ($filter === "Major") {
                        // If "Major", iterate through each sub-filter and its options
                        foreach ($subFilters as $faculty => $majors) {
                            echo "<li>$faculty";
                            echo "<ul>";
                            foreach ($majors as $major) {
                                echo "<li><a href=\"#\" onclick=\"filterCourses('$major')\">$major</a></li>"; // Add onclick event to call filterCourses function with selected major
                            }
                            echo "</ul>";
                            echo "</li>";
                        }
                    } else {
                        // If not "Major", directly iterate through options
                        foreach ($subFilters as $option) {
                            echo "<li><a href=\"#\" onclick=\"filterCourses('$option')\">$option</a></li>"; // Add onclick event to call filterCourses function with selected option
                        }
                    }
                    echo "</ul>";
                    echo "</li>";
                }
                ?>
            </ul>
        </div>
    </main>

    <div class="card-container" id="card-container">
        <?php
        // Function to truncate text
        function truncateText($text, $maxLength)
        {
            if (strlen($text) > $maxLength) {
                $truncatedText = substr($text, 0, $maxLength) . '...';
                return $truncatedText;
            } else {
                return $text;
            }
        }

        // Reopen the connection before querying for course data
        $sql = "SELECT course.course_name, major.major_name, course.*
        FROM course
        INNER JOIN major ON course.major_id = major.major_id";
        $result = $conn->query($sql);

        if ($result->num_rows > 0) {
            // Output data of each row
            while ($row = $result->fetch_assoc()) {
                echo '<div class="card">';
                echo '<img src="./img/filter/' . $row["img"] . '">';
                // echo '<img src="' . $row["img"] . '">';
                echo '<div class="card-content">';
                echo '<p>' . $row["major_name"] . '</p>';
                echo '<h5>' . $row["difficulty"] . '</h5>';
                echo '<h3>' . $row["course_name"] . '</h3>';
                // Truncate the description to 100 characters
                $truncatedDescription = truncateText($row["description"], 100);
                echo '<p>' . $truncatedDescription . '</p>';
                echo '<a href="../courses/course_detail.php?course_id=' . $row["course_id"] . '" class="btn">Read More</a>';
                echo '<br>';
                echo '<section class="course-details">';
                echo '<div class="course-duration">' . $row["price"] . '</div>';
                echo '<div class="course-duration">' . $row["duration"] . '</div>';
                echo '<div class="course-availability">Available now</div>';
                echo '</section>';
                echo '</div>';
                echo '</div>';
            }
        } else {
            echo "0 results";
        }
        $conn->close(); // Close the connection after fetching course data
        ?>

    </div>
    <script>
        // Function to filter courses based on selected filter
        function filterCourses(selectedOption) {
            const cards = document.querySelectorAll('.card'); // Get all cards

            // Hide all cards
            cards.forEach(card => {
                card.style.display = 'none';
            });

            // Show cards with matching major or selected option
            cards.forEach(card => {
                const major = card.querySelector('p').textContent; // Get the major associated with the card
                const category = card.querySelector('.course-details .course-duration').textContent; // Get the category associated with the card
                if (major === selectedOption || category === selectedOption) {
                    card.style.display = 'block'; // Show the card if it matches the selected option
                }
            });
        }
    </script>
    <style>
        .course-details {
            padding: 24px 0;
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            align-items: flex-start;
            align-content: flex-start;
            align-self: stretch;
            max-width: 383px;
            gap: 20px;
            color: #555;
            font-weight: 400;
            text-transform: uppercase;
        }

        .course-price {
            display: flex;
            align-items: flex-start;
            gap: 2px;
            white-space: nowrap;
            padding: 4px 20px;
        }

        .price-value {
            font: 16px/150% Merriweather Sans, -apple-system, Roboto, Helvetica, sans-serif;
        }

        .price-asterisk {
            font: 12px Merriweather Sans, sans-serif;
        }

        .course-duration,
        .course-availability {
            font: 10px/150% Merriweather Sans, -apple-system, Roboto, Helvetica, sans-serif;
        }

        .card-content h5 {
            margin-top: 10px;
            /* Adjust the spacing between h5 and the paragraph above it */
            margin-bottom: 5px;
            /* Adjust the spacing between h5 and h3 below it */
        }

        .card-content h3 {
            font-size: 22px;
        }

        .course-details div {
            margin-bottom: -100px;
            /* Adjust the spacing between the span elements and the card below */
        }

        .wrapper ul li>ul li>a {
            color: #fff;
            /* Set the desired text color */
            text-decoration: none;
            /* Remove underline */
        }

        .wrapper ul li>ul li>a:hover {
            color: #fff;
            /* Set the desired text color on hover */
            text-decoration: underline;
            /* Add underline on hover */
        }
    </style>
</body>

</html>