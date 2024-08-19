<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./css/style.css">
    <link rel="stylesheet" href="../node_modules/bootstrap-icons/font/bootstrap-icons.min.css">
    <title>Document</title>
</head>

<body class="flex">
    <?php
    // Include sidebar content
    include 'sidebar2.php';
    ?>

    <div class="flex-1 bg-white p-10">
        <?php
        include_once 'conn.php'; // Include the database connection file

        // Set the default week ID to 1 if not provided in the URL
        // $default_week_id = 1;

        // Check if the week_id parameter is provided in the URL, otherwise use the default week ID
        $week_id = isset($_GET['week_id']) ? intval($_GET['week_id']) : 1; // Assuming default week ID is 1 if not provided

        // Sanitize and validate user input to prevent SQL injection
        $week_id = $conn->real_escape_string($week_id);

        // Query to fetch content for the specified week from the database
        $sql = "SELECT w.week_id, w.week_name, t.topic_id, t.topic_name, s.summary_title, v.video_title, q.quiz_name
        FROM week w
        LEFT JOIN topic t ON w.week_id = t.week_id
        LEFT JOIN summary s ON t.topic_id = s.topic_id
        LEFT JOIN video v ON t.topic_id = v.topic_id
        LEFT JOIN quiz q ON t.topic_id = q.topic_id
        WHERE w.week_id = $week_id";

        $result = $conn->query($sql);

        // Check if the query was successful
        if ($result) {
            if ($result->num_rows > 0) {
                // Output data of each row
                while ($row = $result->fetch_assoc()) {
                    // Output topic and associated resources
                    echo "<div class='p-2.5 mt-3 flex items-center px-4 duration-300 cursor-pointer border border-black hover:bg-gray-700 text-black' onclick='dropdown2({$row['week_id']})'>
                    <div class='flex justify-start items-start'>
                        <span class='text-sm text-black mr-3' id='arrow2{$row['topic_id']}'>
                            <i class='bi bi-chevron-right'></i>
                        </span>
                        <span class='text-sm font-bold'>{$row['topic_name']}</span>
                    </div>
                </div>";

                    if ($row['video_title'] || $row['summary_title'] || $row['quiz_name']) {
                        echo "<div class='text-sm text-black font-bold text-start hidden' id='submenu2{$row['week_id']}'>"; // Open submenu div with inline style to hide it

                        // Output Video link if available
                        if ($row['video_title']) {
                            echo "<a href='http://localhost:8080/eBusiness/webiste/pages/videoPlayer.php?week_id={$week_id}' class='cursor-pointer p-2 hover:bg-blue-600 bg-white border border-black flex items-center justify-between relative'>
                            <div>
                                <i class='bi bi-play-circle-fill text-black mr-2'></i>
                                <span>{$row['video_title']}</span>
                            </div>
                            <span class='absolute top-0 left-0 right-0 h-1 bg-gradient-to-b from-transparent via-white to-white'></span>
                        </a>";
                        }

                        // Output Summary link if available
                        if ($row['summary_title']) {
                            echo "<a href='http://localhost:8080/eBusiness/webiste/pages/summary.php?week_id={$week_id}' class='cursor-pointer p-2 hover:bg-blue-600 bg-white border border-black flex items-center justify-between relative'>
                            <div>
                                <i class='bi bi-file-earmark-text-fill text-black mr-2'></i>
                                <span>{$row['summary_title']}</span>
                            </div>
                            <span class='absolute top-0 left-0 right-0 h-1 bg-gradient-to-b from-transparent via-white to-white'></span>
                        </a>";
                        }

                        // Output Quiz link if available
                        if ($row['quiz_name']) {
                            echo "<a href='#' class='cursor-pointer p-2 hover:bg-blue-600 bg-white border border-black flex items-center justify-between relative'>
                            <div>
                                <i class='bi bi-file-earmark-text-fill text-black mr-2'></i>
                                <span>{$row['quiz_name']}</span>
                            </div>
                            <span class='absolute top-0 left-0 right-0 h-1 bg-gradient-to-b from-transparent via-white to-white'></span>
                        </a>";
                        }

                        echo "</div>"; // Close submenu div
                    }
                }
            } else {
                echo "No content available for the selected week";
            }
        } else {
            echo "Error: " . $conn->error;
        }

        // Close the database connection
        $conn->close();
        ?>

    </div>

    <script src="./js/index.js"></script>
</body>

</html>