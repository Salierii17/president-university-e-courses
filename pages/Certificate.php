<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Course Dashboard</title>
  <link rel="stylesheet" href="./css/styles2.css" />
  <link rel="stylesheet" href="./css/style.css" />
  <link rel="stylesheet" href="../node_modules/bootstrap-icons/font/bootstrap-icons.min.css">
</head>

<body class="flex">
    <?php
    // Include sidebar content
    include 'sidebar2.php';
    ?>
    
    </aside>
    <main class="course-content">
      <div class="box-certificate">
        <div class="certificate">
          <img src="../assets/images/courses_detail/certificate.png" alt="" />
        </div>
        <img src="" alt="" />
        <p class="certificate-description">Congratulations on getting your certificate!</p>
        <p class="certificate-description-1">You complete this course by August 14, 2023</p>
        <div class="buttons">
          <button class="btn">Donwload Certificate</button>
          <button class="btn">Share Certificate</button>
        </div>
      </div>
    </main>
  </div>

  <script src="./js/script1.js"></script>
  <script src="./js/index.js"></script>
</body>

</html>