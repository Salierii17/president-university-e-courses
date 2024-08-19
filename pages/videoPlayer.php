<?php
include "conn.php";

// Query to retrieve video details
$sql = "SELECT * FROM video";
$result = $conn->query($sql);

// Check if query was successful
if ($result->num_rows > 0) {
    // Fetch data from the first row
    $row = $result->fetch_assoc();

    // Assign fetched data to variables
    $videoTitle = $row['video_title'];
    $uploadDate = $row['upload_date'];
    $videoDescription = $row['description'];
    $videoLink = $row['video_link'];

    // Function to format date
    function formatDate($date)
    {
        return date("F j, Y", strtotime($date));
    }

    // Sample rating variables
    $likes = 500;
    $dislikes = 100;

    // Sample comments array
    $comments = array(
        array("user" => "John", "comment" => "Great video!"),
        array("user" => "Alice", "comment" => "I learned a lot from this."),
        array("user" => "Bob", "comment" => "Could be better.")
    );
} else {
    echo "0 results";
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./css/style7.css">
    <link rel="stylesheet" href="../node_modules/bootstrap-icons/font/bootstrap-icons.css">
    <title>Video Player</title>
</head>

<body class="flex h-screen">

    <?php
    // Include sidebar content
    include 'sidebar2.php';
    ?>

    <div class="flex flex-col flex-1 overflow-hidden">
        <div class="flex-1 p-10 overflow-y-auto">
            <h1 class="text-3xl font-bold mb-6"><?php echo $videoTitle; ?></h1>

            <!-- Video Player Content -->
            <div class="bg-white p-6 shadow-md rounded-lg">
                <!-- Video Player -->
                <video controls preload="auto" class="w-full mb-4">
                    <source src="<?php echo $videoLink; ?>" type="video/mp4">
                    Your browser does not support the video tag.
                </video>

                <!-- Video Information -->
                <div class="flex items-center justify-between mb-4">
                    <div>
                        <h2 class="text-xl"><?php echo $videoTitle; ?></h2>
                        <div class="flex items-center mt-2">
                            <span class="text-gray-600"><?php echo formatDate($uploadDate); ?></span>
                        </div>
                    </div>
                    <!-- Video Rating -->
                    <div class="flex items-end">
                        <form method="post" action="">
                            <button type="submit" name="like" class="mr-2">
                                <i class="fas fa-thumbs-up"></i> <?php echo $likes; ?>
                            </button>
                            <button type="submit" name="dislike">
                                <i class="fas fa-thumbs-down"></i> <?php echo $dislikes; ?>
                            </button>
                        </form>
                    </div>
                </div>

                <!-- Video Description -->
                <p class="text-gray-600"><?php echo $videoDescription; ?></p>
            </div>
        </div>
        <nav id="bottom-navigation" class="bottom-0 left-0 w-full bg-gray-800 p-4 flex justify-between items-center text-white">
            <a href="learn.php?course_id=1 &week_id=1" id="prev-topic" class="flex items-center py-2 px-4 bg-gray-600 hover:bg-gray-700 rounded">
                <i class="bi bi-arrow-left-circle-fill mr-2"></i>
                Back
            </a>
            <span id="current-topic" class="text-lg">Introduction Information System</span>
            <a href="summary.php" id="next-topic" class="flex items-center py-2 px-4 bg-gray-600 hover:bg-gray-700 rounded">
                Next
                <i class="bi bi-arrow-right-circle-fill ml-2"></i>
            </a>
        </nav>
    </div>

    <script src="./js/index.js"></script>
</body>

</html>