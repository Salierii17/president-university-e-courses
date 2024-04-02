<?php
// Include the database connection
include '../conn.php';

// Function to sanitize input
function sanitize($data)
{
    return htmlspecialchars($data); // You might need to adjust this based on your specific requirements
}

// Retrieve topic_id from the URL
$topic_id = isset($_GET['topic_id']) ? sanitize($_GET['topic_id']) : null;

// Fetch quizzes for the specified topic
$sqlQuizzes = "SELECT * FROM quiz_questions WHERE quiz_id IN (SELECT quiz_id FROM quiz WHERE topic_id = ?)";
$stmtQuizzes = $conn->prepare($sqlQuizzes);
$stmtQuizzes->bind_param("i", $topic_id);
$stmtQuizzes->execute();
$resultQuizzes = $stmtQuizzes->get_result();

// Close the prepared statement
$stmtQuizzes->close();
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quiz</title>
    <link rel="stylesheet" href="./css/styles2.css">
    <link rel="stylesheet" href="../assets/css/style.css">
    <link rel="stylesheet" href="../../node_modules/bootstrap-icons/font/bootstrap-icons.min.css">
</head>

<body class="flex">
    <div class=" inset-y-0 left-0 w-60 bg-gray-800 text-white ">
        <?php
        // Include sidebar content
        include 'sidebar.php';
        ?>
    </div>

    <div class="flex-1 bg-white p-10">
        <div class="dashboard">
            <main class="content">
                <header class="content-header">
                    <div class="breadcrumb">
                        <a href="./Learn.html" class="breadcrumb-link">My Course</a>
                        <span class="breadcrumb-separator">&gt;</span>
                        <a href="./Learn.html" class="breadcrumb-link">Topic 1</a>
                        <span class="breadcrumb-separator">&gt;</span>
                        <span class="breadcrumb-current">Quiz</span>
                    </div>
                </header>

                <article class="quiz-content">
                    <form id="quizForm">
                        <?php while ($quiz = $resultQuizzes->fetch_assoc()) : ?>
                            <section class="course-quiz">
                                <h2>Quiz for <?= sanitize($quiz['question']) ?></h2>

                                <!-- Display quiz questions -->
                                <div class="quiz-topic">
                                    <div class="quiz-question" data-correct="<?= sanitize($quiz['correct_answer']) ?>">
                                        <p><?= sanitize($quiz['question']) ?></p>
                                        <input type="radio" name="answer<?= $quiz['quiz_id'] ?>" value="a"> A. <?= sanitize($quiz['option_a']) ?><br>
                                        <input type="radio" name="answer<?= $quiz['quiz_id'] ?>" value="b"> B. <?= sanitize($quiz['option_b']) ?><br>
                                        <input type="radio" name="answer<?= $quiz['quiz_id'] ?>" value="c"> C. <?= sanitize($quiz['option_c']) ?><br>
                                        <input type="radio" name="answer<?= $quiz['quiz_id'] ?>" value="d"> D. <?= sanitize($quiz['option_d']) ?><br>
                                        <span class="result"></span>
                                    </div>
                                </div>
                            </section>
                        <?php endwhile; ?>
                        <button type="button" class="submit-quiz-btn" onclick="submitQuiz()">Submit Quiz</button>
                    </form>
                </article>
            </main>
        </div>

    </div>
    <footer class="bg-gray-800 text-white p-4 fixed bottom-0 w-full">
        <nav id="bottom-navigation" class="bottom-0 left-0 w-full flex justify-between items-center text-white">
            <a href="summary.php?topic_id=<?= $topic_id ?>" id="prev-topic" class="flex items-center py-2 px-4 bg-gray-600 hover:bg-gray-700 rounded">
                <i class="bi bi-arrow-left-circle-fill mr-2"></i>
                Previous
            </a>
            <div class="flex-grow flex justify-center my-2 md:my-0">
                <span id="current-topic" class="text-lg">Current Topic</span>
            </div>
            <a href="learn.php?topic_id=<?= $topic_id ?>" id="next-topic" class="flex items-center py-2 px-4 bg-gray-600 hover:bg-gray-700 rounded">
                Next
                <i class="bi bi-arrow-right-circle-fill ml-2"></i>
            </a>
        </nav>
    </footer>

    <script>
        function submitQuiz() {
            var quizForm = document.getElementById('quizForm');
            var questions = quizForm.querySelectorAll('.quiz-question');

            questions.forEach(function(question) {
                var correctAnswer = question.getAttribute('data-correct');
                var selectedOption = question.querySelector('input[type="radio"]:checked');
                var resultSpan = question.querySelector('.result');

                if (selectedOption) {
                    var userAnswer = selectedOption.value;

                    if (userAnswer === correctAnswer) {
                        resultSpan.textContent = 'Correct!';
                        resultSpan.style.color = 'green';
                    } else {
                        resultSpan.textContent = 'Incorrect. Correct Answer: ' + correctAnswer;
                        resultSpan.style.color = 'red';
                    }
                } else {
                    resultSpan.textContent = 'No answer selected.';
                    resultSpan.style.color = 'orange';
                }
            });
        }
    </script>
    <script src="./js/index.js"></script>

</body>

</html>

<?php
// Close the database connection
$conn->close();
?>