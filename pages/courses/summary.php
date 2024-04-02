<?php
include "../conn.php";

// Get the topic_id from the URL
if (isset($_GET['topic_id'])) {
    $topic_id = $_GET['topic_id'];
}
// Fetch the summary from the database
$sql = "SELECT * FROM summary WHERE topic_id = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $topic_id);
$stmt->execute();
$result = $stmt->get_result();

// Check if the query was successful and if there is a summary available
if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();
    $summaryTitle = $row['summary_title'];
    $summaryContent = $row['summary_content'];
} else {
    $summaryTitle = "Summary Not Found";
    $summaryContent = "No summary available for this topic.";
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../assets/css/style.css">
    <link rel="stylesheet" href="../../node_modules/bootstrap-icons/font/bootstrap-icons.css">
    <title>Document</title>
</head>

<body class="flex h-screen">

    <div class="inset-y-0 left-0 w-60 bg-gray-800 text-white ">
        <?php
        // Include sidebar content
        include 'sidebar.php';
        ?>
    </div>

    <div class="flex flex-col flex-1 overflow-hidden">
        <div class="flex-1 p-10 overflow-y-auto">
            <h1 class="text-3xl font-bold mb-6"><?php echo $summaryTitle; ?></h1>

            <!-- Summary Content Goes Here -->
            <div class="bg-white p-6 shadow-md rounded-lg">
                <p class="text-justify text-base font-serif"><?php echo $summaryContent; ?></p>
            </div>
        </div>

    </div>
    <footer class="bg-gray-800 text-white p-4 fixed bottom-0 w-full">
        <nav id="bottom-navigation" class="bottom-0 left-0 w-full flex justify-between items-center text-white">
            <a href="videoPlayer.php?topic_id=<?= $topic_id ?>" id="prev-topic" class="flex items-center py-2 px-4 bg-gray-600 hover:bg-gray-700 rounded">
                <i class="bi bi-arrow-left-circle-fill mr-2"></i>
                Previous
            </a>
            <div class="flex-grow flex justify-center my-2 md:my-0">
                <span id="current-topic" class="text-lg">Current Topic</span>
            </div>
            <a href="quiz.php?topic_id=<?= $topic_id ?>" id="next-topic" class="flex items-center py-2 px-4 bg-gray-600 hover:bg-gray-700 rounded">
                Next
                <i class="bi bi-arrow-right-circle-fill ml-2"></i>
            </a>
        </nav>
    </footer>
    <script src="./js/index.js"></script>
</body>

</html>