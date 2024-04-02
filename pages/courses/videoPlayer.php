<?php
include "../conn.php";

// Get the topic_id from the URL
if (isset($_GET['topic_id'])) {
    $topic_id = $_GET['topic_id'];
}
// Query to retrieve video details
$sql = "SELECT * FROM video WHERE topic_id = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $topic_id);
$stmt->execute();
$result = $stmt->get_result();
// Check if query was successful
if ($result->num_rows > 0) {
    // Fetch data from the first row
    $row = $result->fetch_assoc();

    // Assign fetched data to variables
    $videoTitle = $row['video_title'];
    $uploadDate = $row['upload_date'];
    $videoDescription = $row['description'];
    $videoLink = $row['video_link'];

    // Function to format view count with commas
    function formatViews($views)
    {
        return number_format($views);
    }

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

<html lang="en">

<head>
    <!-- Metadata -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Stylesheets -->
    <link rel="stylesheet" href="../assets/css/style.css">
    <link rel="stylesheet" href="../../node_modules/@fortawesome/fontawesome-free/css/all.css">
    <link rel="stylesheet" href="../../node_modules/video.js/dist/video-js.css">
    <link rel="stylesheet" href="../../node_modules/bootstrap-icons/font/bootstrap-icons.css">

    <!-- Title -->
    <title>Document</title>
</head>


<body class="flex h-screen">

    <?php
    // Include sidebar content
    include 'sidebar.php';
    ?>

    <div class="flex flex-col flex-1 overflow-hidden">
        <div class="flex-1 p-10 overflow-y-auto">
            <h1 class="text-3xl font-bold mb-6"><?php echo $summaryTitle; ?></h1>

            <!-- Video Player -->
            <div class="bg-white p-6 shadow-md rounded-lg">
                <video id="my-video" class="w-full h-auto" controls preload="auto" poster="./img/filter/Laptop.png">
                    <source src="<?php echo $videoLink; ?>" type="video/mp4">
                </video>
            </div>

            <!-- Summary Content Goes Here -->
            <div class="bg-white p-6 shadow-md rounded-lg mt-6">
                <p class="text-justify text-base font-serif"><?php echo $summaryContent; ?></p>
            </div>
        </div>
    </div>
    <footer class="bg-gray-800 text-white p-4 fixed bottom-0 w-full">
    <nav id="bottom-navigation" class="bottom-0 left-0 w-full flex justify-between items-center text-white">
            <a href="learn.php?topic_id=<?= $topic_id ?>" id="prev-topic" class="flex items-center py-2 px-4 bg-gray-600 hover:bg-gray-700 rounded">
                <i class="bi bi-arrow-left-circle-fill mr-2"></i>
                Previous
            </a>
            <div class="flex-grow flex justify-center my-2 md:my-0">
                <span id="current-topic" class="text-lg">Current Topic</span>
            </div>
            <a href="summary.php?topic_id=<?= $topic_id ?>" id="next-topic" class="flex items-center py-2 px-4 bg-gray-600 hover:bg-gray-700 rounded">
                Next
                <i class="bi bi-arrow-right-circle-fill ml-2"></i>
            </a>
        </nav>
    </footer>

    <script src="./js/index.js"></script>
</body>

</html>