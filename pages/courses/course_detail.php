<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Introduction to Information System</title>
    <link rel="stylesheet" href="./css/course_detail.css">
</head>

<body>

    <?php
    // Include the database connection file
    include '../conn.php';

    // Check if the course ID is provided in the URL
    if (isset($_GET['course_id'])) {
        // Get the course ID from the URL
        $course_id = $_GET['course_id'];

        // Prepare a SQL statement to fetch course details
        $sql = "SELECT * FROM course WHERE course_id = ?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("i", $course_id);
        $stmt->execute();
        $result = $stmt->get_result();

        // Check if the course exists and fetch its data
        if ($row = $result->fetch_assoc()) {
            // Course details
            $course_name = $row['course_name'];
            $course_description = $row['description'];
            $img = "./img/filter/" . $row['img']; // Adjust the path as needed
            // $img = $row['img'];
            $start_date = new DateTime($row['start_date']);
            $duration = $row['duration'];
            $time_commitment = $row['time'];
            $course_language = $row['language'];
            $difficulty = $row['difficulty'];
            // Assuming 'objective' is a column in your course table. Add it if it doesn't exist.
            $objectives = isset($row['objective']) ? explode('|', $row['objective']) : []; // Separate objectives by '|' in your database
        } else {
            echo "Course not found!";
        }

        // Close the statement and connection
        $stmt->close();
        $conn->close();
    } else {
        // Redirect to an error page or display an error message
        echo "Error: Course ID not provided in the URL";
        exit; // Stop further execution
    }
    ?>

    <header class="header">
        <div class="header-top">
            <a href="../courses/filter.php">
                <button class="menu-button">☰ VIEW ALL COURSES</button>
            </a>
            <div class="logo-container">
                <img src="./img/courses_detail/President_University_Logo.png" alt="President University Logo" class="university-logo">
                <a href="../homepage/homepage.php"><span style="color: white;">President University <br> E-Course</span></a>
            </div>
            <input type="search" placeholder="Search" class="search-box">
        </div>
        <div class="header-main">
            <div class="header-content">
                <h1><?= htmlspecialchars($course_name) ?></h1>
                <p>Explore the opportunities and difficulties facing widespread adoption of digital technologies in health care.</p>
                <a href="./learn.php?course_id=<?= $course_id ?>&week_id=1" class="learn-more-btn">LEARN</a>
                
                <div class="retangle">
                    <span class="people">
                        <img src="./img/courses_detail/people.png" alt="" />
                        <!-- PHP Code panggil total amount course dari Tabel Course -->
                        <b>100</b>
                    </span>
                    <span class="star">
                        <img src="./img/courses_detail/star.png" alt="" />
                        <!-- PHP Code panggil total Star course dari Tabel Course -->
                        <b>4,5/5</b>
                    </span>
                </div>
            </div>
            <div class="header-image">
                <!-- Ensure the image path is correct based on your project structure -->
                <img src="<?= htmlspecialchars($img) ?>" alt="Course Image">
            </div>
        </div>
    </header>

    <main class="course-main">
        <section class="course-content">
            <h2>What you'll learn</h2>
            <div class="learning-objectives">
                <?php foreach ($objectives as $objective) : ?>
                    <p><?= htmlspecialchars($objective) ?></p>
                <?php endforeach; ?>
            </div>

            <h2>Course description</h2>
            <!-- Display course description dynamically -->
            <p> <?php echo nl2br(htmlspecialchars($course_description)); ?> </p>
        </section>

        <aside class="course-sidebar">
            <div class="sidebar-section">
                <h3>DATE</h3>
                <p><?= $start_date->format('F d, Y') ?></p>
            </div>
            <div class="sidebar-section">
                <h3>DURATION</h3>
                <p><?= htmlspecialchars($duration) ?></p>
            </div>
            <div class="sidebar-section">
                <h3>TIME COMMITMENT</h3>
                <p><?= htmlspecialchars($time_commitment) ?></p>
            </div>
            <div class="sidebar-section">
                <h3>COURSE LANGUAGE</h3>
                <p><?= htmlspecialchars($course_language) ?></p>
            </div>
            <div class="sidebar-section">
                <h3>DIFFICULTY</h3>
                <p><?= htmlspecialchars($difficulty) ?></p>
            </div>
            <!-- Other sidebar content unchanged -->
            <div class="sidebar-section">
                <h3>TOPICS</h3>
                <div class="course-topics">
                    <span class="topic-tag">CODING</span>
                    <span class="topic-tag">DATABASE</span>
                    <span class="topic-tag">OOP</span>
                    <span class="topic-tag">WEB PROGRAMMING</span>
                </div>
            </div>
            <br>
            <div class="logo-container-sidebar">
                <img src="./img/courses_detail/President_University_Logo.png" alt="President University Logo" class="sidebar-logo">
            </div>
            <div class="sidebar-section">
                <h3 style="text-align: center; color: black;">Faculty of</h3>
                <h3 style="text-align: center; color: black;">Computer Science</h3>
            </div>
        </aside>
    </main>

    <!-- Other sections and footer unchanged -->

    <section class="lectures-section">
        <h2>Lectures</h2>
        <div class="lecturer-info">
            <img src="./img/courses_detail/Person.png" alt="Stanley Y. Shaw" class="lecturer-image">
            <h3>Stanley Y. Shaw</h3>
            <p>Associate Dean for Executive Education</p>
        </div>
    </section>

    <section class="recommendations-section">
        <h2>You may also like</h2>
        <div class="course-cards-container">
            <article class="course-card">
                <img src="./img/courses_detail/1.png" alt="Community Health Worker" class="course-image">
                <div class="course-info">
                    <h3 class="course-category">HEALTH & MEDICINE</h3>
                    <p class="course-delivery">ONLINE</p>
                    <p class="course-title"><b>Strengthening Community Health Worker Programs</b></p>
                    <p class="course-description">Learn to deliver high-quality primary health care at scale through national community health worker programs.</p>
                    <p class="course-price">FREE*</p>
                    <p class="course-availability">AVAILABLE NOW</p>
                </div>
            </article>
            <article class="course-card">
                <img src="./img/courses_detail/2.png" alt="Community Health Worker" class="course-image">
                <div class="course-info">
                    <h3 class="course-category">HEALTH & MEDICINE</h3>
                    <p class="course-delivery">ONLINE</p>
                    <p class="course-title"><b>The Opioid Crisis in America</b></p>
                    <p class="course-description">Learn about the opioid epidemic in the United States, including information about treatment and recovery from opioid addiction.</p>
                    <p class="course-price">FREE*</p>
                    <p class="course-availability">AVAILABLE NOW</p>
                </div>
            </article>
            <article class="course-card">
                <img src="./img/courses_detail/3.png" alt="Community Health Worker" class="course-image">
                <div class="course-info">
                    <h3 class="course-category">HEALTH & MEDICINE</h3>
                    <p class="course-delivery">IN-PERSON, ONLINE LIVE</p>
                    <p class="course-title"><b>Global Health Care Leaders Program</b></p>
                    <p class="course-description">The Global Health Care Leaders Program (GHLP) is a multi-modular global program that aims to bring together the most important topics defining the future of health care industry for the leaders who will lead the charge.</p>
                    <p class="course-price">$30,000</p>
                    <p class="course-availability">STARTS on SEP, 23</p>
                </div>
            </article>
        </div>
    </section>

    <footer class="site-footer">
        <div class="footer-content">
            <div class="footer-logo">
                <img src="./img/courses_detail/President_University_Logo.png" alt="President University Logo" class="footer-university-logo">
                <span>President University</span>
                <span>E-Course</span>
            </div>
            <div class="footer-links">
                <a href="#">Accessibility</a>
                <a href="#">Privacy Policy</a>
                <a href="#">Terms of Use</a>
                <a href="#">EEA Privacy Disclosures</a>
            </div>
        </div>
    </footer>
</body>

</html>