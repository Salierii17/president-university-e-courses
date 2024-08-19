<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./css/style7.css">
    <link rel="stylesheet" href="../node_modules/bootstrap-icons/font/bootstrap-icons.css">
    <title>Document</title>
</head>

<body class="flex h-screen">

    <?php
    // Include sidebar content
    include 'sidebar2.php';
    ?>

    <div class="flex flex-col flex-1 overflow-hidden">
        <div class="flex-1 p-10 overflow-y-auto">
            <h1 class="text-3xl font-bold mb-6">Summary of Introduction to Information System</h1>

            <!-- Summary Content Goes Here -->
            <div class="bg-white p-6 shadow-md rounded-lg">
                <h2 class="text-justify text-base font-serif">Information Systems (IS) form the backbone of modern organizations, providing the infrastructure necessary for managing, processing, and disseminating information effectively. In essence, IS represent the intersection of people, processes, and technology, enabling organizations to achieve their objectives efficiently and competitively in today's dynamic business environment.

                    At its core, an Information System comprises hardware, software, data, procedures, and people. These components work together to collect, store, process, and distribute information to support decision-making, coordination, control, analysis, and visualization within an organization.

                    Understanding the various types of Information Systems is crucial. These include Transaction Processing Systems (TPS), which handle routine transactions; Management Information Systems (MIS), providing middle management with reports and summaries; Decision Support Systems (DSS), aiding in complex decision-making processes; and Executive Information Systems (EIS), catering to the strategic information needs of top-level executives.

                    The functions of Information Systems within organizations are diverse and critical.<br><br>They streamline business processes, enhance decision-making capabilities, improve collaboration and communication, and enable strategic planning and innovation. Moreover, Information Systems play a pivotal role in gaining competitive advantages, fostering customer relationships, and ensuring data security and privacy.

                    Despite their immense benefits, implementing and managing Information Systems pose challenges. Organizations must navigate issues related to technological complexity, data integrity, security threats, and organizational change management to fully leverage the potential of Information Systems.

                    Nevertheless, Information Systems continue to evolve rapidly, driven by emerging technologies such as artificial intelligence, big data analytics, and the Internet of Things. These innovations promise to revolutionize how organizations operate, offering new opportunities for growth, efficiency, and value creation.

                    In conclusion, a strong foundation in Information Systems is essential for understanding the pivotal role technology plays in modern organizations. By harnessing the power of Information Systems effectively, organizations can unlock new levels of productivity, innovation, and competitive advantage in today's digital age.</p>
            </div>
        </div>
        <nav id="bottom-navigation" class="bottom-0 left-0 w-full bg-gray-800 p-4 flex justify-between items-center text-white">
            <a href="videoPlayer.php" id="prev-topic" class="flex items-center py-2 px-4 bg-gray-600 hover:bg-gray-700 rounded">
                <i class="bi bi-arrow-left-circle-fill mr-2"></i>
                Previous
            </a>
            <span id="current-topic" class="text-lg">Introduction Information System</span>
            <a href="quiz.php" id="next-topic" class="flex items-center py-2 px-4 bg-gray-600 hover:bg-gray-700 rounded">
                Next
                <i class="bi bi-arrow-right-circle-fill ml-2"></i>
            </a>
        </nav>
    </div>

    <script src="./js/index.js"></script>
</body>

</html>