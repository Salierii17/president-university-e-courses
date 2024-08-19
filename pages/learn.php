<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./css/style7.css">
    <link rel="stylesheet" href="./css/learn.css">
    <link rel="stylesheet" href="../node_modules/bootstrap-icons/font/bootstrap-icons.min.css">
    <title>Document</title>
</head>

<body class="flex">
    <?php
    // Include sidebar content
    include 'sidebar2.php';
    ?>

    <div class="flex-1 bg-white p-10">
        <main class="course-content">
            <section class="accordion">
                <div class="course-topics">
                    <?php
                    // Include the database connection file
                    include_once 'conn.php';

                    // Check if the week_id is provided in the URL
                    if (isset($_GET['week_id'])) {
                        // Retrieve the week_id from the URL
                        $week_id = $_GET['week_id'];

                        // Query to fetch topics based on the provided week_id
                        $query = "SELECT t.topic_id, t.topic_name, v.video_title, s.summary_title, q.quiz_name
                                    FROM topic t
                                    LEFT JOIN video v ON t.topic_id = v.topic_id
                                    LEFT JOIN summary s ON t.topic_id = s.topic_id
                                    LEFT JOIN quiz q ON t.topic_id = q.topic_id
                                    WHERE t.week_id = ?";

                        // Prepare the SQL statement
                        $stmt = $conn->prepare($query);
                        // Bind the parameter
                        $stmt->bind_param("i", $week_id);
                        // Execute the statement
                        $stmt->execute();
                        // Get the result
                        $result = $stmt->get_result();

                        // Initialize a counter
                        $topic_counter = 1;

                        // Check if topics are found
                        if ($result && $result->num_rows > 0) {
                            while ($row = $result->fetch_assoc()) {
                                $topic_id = $row['topic_id'];
                                $topic_name = $row['topic_name'];
                                $video_title = $row['video_title'] ?? "";
                                $summary_title = $row['summary_title'] ?? "";
                                $quiz_name = $row['quiz_name'] ?? "";

                                // Output the topic HTML
                                echo "<div class='topic'>
                                        <div class='topic-header' onclick=\"toggleTopic('topic$topic_id-content')\">
                                            <h3>Topic $topic_counter - $topic_name</h3>
                                            <span class='status " . (($video_title || $summary_title || $quiz_name) ? "complete" : "incomplete") . "'>" . (($video_title || $summary_title || $quiz_name) ? "Finished" : "Not Finished") . "</span>
                                        </div>
                                        <div id='topic$topic_id-content' class='topic-content' style='display: none'>";

                                // Output Video link if available
                                if ($video_title) {
                                    echo "<a href='videoPlayer.php?topic_id=$topic_id' class='topic-item'>
                                        <span>Video</span>
                                        <span class='brief-info'>$video_title</span>
                                        <span class='status complete'>Finished</span>
                                    </a>";
                                }

                                // Output Summary link if available
                                if ($summary_title) {
                                    echo "<a href='summary.php' class='topic-item'>
                                                <span>Summary</span>
                                                <span class='brief-info'>$summary_title</span>
                                                <span class='status complete'>Finished</span>
                                            </a>";
                                }

                                // Output Quiz link if available
                                if ($quiz_name) {
                                    echo "<a href='quiz.php' class='topic-item'>
                                                <span>Quiz</span>
                                                <span class='brief-info'>$quiz_name</span>
                                                <span class='status complete'>Finished</span>
                                            </a>";
                                }

                                echo "</div></div>";

                                // Increment the counter
                                $topic_counter++;
                            }
                        } else {
                            echo "No topics found for the selected week.";
                        }

                        // Close the statement
                        $stmt->close();
                    } else {
                        echo "Error: Week ID not provided in the URL";
                    }

                    // Close the database connection
                    $conn->close();
                    ?>
                </div>
            </section>
        </main>
    </div>

    <script>
        function toggleTopic(id) {
            var element = document.getElementById(id);
            if (element.style.display === "none") {
                element.style.display = "block";
            } else {
                element.style.display = "none";
            }
        }
    </script>
</body>

</html>