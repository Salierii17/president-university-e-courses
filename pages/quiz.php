<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quiz - Topic 1</title>
    <link rel="stylesheet" href="./css/quiz.css">
    <link rel="stylesheet" href="./css/style7.css">
</head>

<body class="flex h-screen">
    <?php
    // Include sidebar content
    include 'sidebar2.php';
    ?>
    <div class="flex flex-col flex-1 overflow-hidden">
        <main class="flex-1 p-10 overflow-y-auto">
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
                <section class="quiz-question">
                    <p>1. It manages the financial information of the firm and plays two important roles in transaction processing.</p>
                    <ol type="a">
                        <li>Information Function</li>
                        <li>Management Function</li>
                        <li>Accounting Function</li>
                        <li>Finance Function</li>
                    </ol>
                    <p>2. Activities that shapes an assambles raw materials into financial products.</p>
                    <ol type="a">
                        <li>Primary Manufacturing Activities</li>
                        <li>Material Management</li>
                        <li>Products Support Activities</li>
                        <li>Data Processing</li>
                    </ol>
                    <p>3. This supports operations-level tasks with highly detailed information about the many business transactions affecting the firm.</p>
                    <ol type="a">
                        <li>Horizontal Flow</li>
                        <li>Outside Flow</li>
                        <li>Vertical Flow</li>
                        <li>Downward Flow</li>
                    </ol>
                    <p>4. Which of the following is not one of the three major classes of information systems?</p>
                    <ol type="a">
                        <li>Decision support system</li>
                        <li>Collaboration system</li>
                        <li>Management information system</li>
                        <li>Transaction processing system</li>
                    </ol>
                </section>
            </article>
        </main>
        <nav id="bottom-navigation" class="bottom-0 left-0 w-full bg-gray-800 p-4 flex justify-between items-center text-white">
            <a href="videoPlayer.php" id="prev-topic" class="flex items-center py-2 px-4 bg-gray-600 hover:bg-gray-700 rounded">
                <i class="bi bi-arrow-left-circle-fill mr-2"></i>
                Previous
            </a>
            <span id="current-topic" class="text-lg">Introduction Information System</span>
            <a href="learn.php?course_id=1 &week_id=1" id="next-topic" class="flex items-center py-2 px-4 bg-gray-600 hover:bg-gray-700 rounded">
                Complate
                <i class="bi bi-arrow-right-circle-fill ml-2"></i>
            </a>
        </nav>
    </div>
    </div>


</body>

</html>