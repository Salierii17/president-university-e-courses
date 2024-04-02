<?php
// Include the database connection file
include '';

// Define other variables
$myCourses = "My courses";

// Query to fetch weeks from the database
$sql = "SELECT w.week_id, w.week_name, c.course_id, m.major_name, c.course_name
        FROM week w
        JOIN course c ON w.course_id = c.course_id
        JOIN major m ON c.major_id = m.major_id";
$result = $conn->query($sql);

// Initialize an empty array to store weeks
$weeks = [];

if ($result->num_rows > 0) {
  // Fetch data from each row and add it to the $weeks array
  while ($row = $result->fetch_assoc()) {
    $weeks[] = [
      "week_id" => $row['week_id'],
      "week_name" => $row['week_name'],
      "major_name" => $row['major_name'],
      "course_name" => $row['course_name'],
      "url" => "./learn.php?week_id=" . $row['week_id']
    ];
  }
}

// If there are no weeks fetched, display a message or take appropriate action
if (empty($weeks)) {
  echo "No weeks found.";
  // Handle the scenario where no weeks are found, redirect to an error page, or take appropriate action.
  exit(); // Terminate further execution of the script
}

// Get the URL of the first week to be displayed by default
$default_week_url = $weeks[0]['url'];

// Define other items
$otherItems = [
  ["icon" => "bi bi-chat-left-text-fill", "text" => "Mentor Chat", "link" => "./mentorchat.php"],
  ["icon" => "bi bi-bookmark-fill", "text" => "Certificate", "link" => "./Certificate.php"]
];

$majorName = $weeks[0]['major_name'];
$courseName = $weeks[0]['course_name'];
?>

<!-- Component: Sidebar -->
<div class="flex h-screen">
  <div class="flex-none w-60 bg-gray-700 text-white p-4 flex flex-col">
    <!-- Sidebar Header -->
    <div class="text-gray-100 text-xl">
      <div class="p-2.5 mt- flex items-center">
        <!-- Logo -->
        <img src="./img/logo.png" class="px-2 py-1 rounded-md"></img>
        <!-- majorName -->
        <h1 class="font-bold text-gray-200 text-[15px] ml-3 text-center">
          <?php echo $majorName; ?>
        </h1>
      </div>
      <!-- Introduction Section -->
      <h1 class="text-center font-bold text-gray-200 text-[15px] ml-3">
        <?php echo $courseName; ?>
      </h1>
      <!-- Divider -->
      <div class="my-2 bg-gray-600 h-[1px]"></div>
    </div>
    <!-- Sidebar Content -->
    <div class="p-2.5 mt-3 flex items-center rounded-md px-4 duration-300 cursor-pointer hover:bg-blue-600 text-white" onclick="dropdown()">
      <!-- Icon -->
      <i class="bi bi-book-fill"></i>
      <!-- Text -->
      <div class="flex justify-between w-full items-center">
        <span class="text-[15px] ml-4 text-gray-200 font-bold"><?php echo $myCourses; ?></span>
        <!-- Arrow Icon -->
        <span class="text-sm rotate-180" id="arrow">
          <i class="bi bi-chevron-down"></i>
        </span>
      </div>
    </div>
    <!-- Dropdown Menu -->
    <div class=" mt-2 text-sm text-gray-200 overflow-x-auto whitespace-nowrap font-bold flex flex-wrap " id="submenu">
      <!-- Menu Items -->
      <?php foreach ($weeks as $week) : ?>
        <a href="<?php echo $week['url']; ?>" class="inline-block p-2 <?php echo ($week['url'] === $default_week_url) ? 'bg-blue-600 text-white' : 'hover:bg-blue-600 text-gray-200'; ?> rounded-md"><?php echo $week['week_name']; ?></a>
      <?php endforeach; ?>
    </div>
    <!-- Other Sidebar Items -->
    <?php foreach ($otherItems as $item) : ?>
      <a href="<?php echo $item['link']; ?>" class="p-2.5 mt-3 flex items-center rounded-md px-4 duration-300 cursor-pointer hover:bg-blue-600 text-white">
        <i class="<?php echo $item['icon']; ?>"></i>
        <span class="text-[15px] ml-4 text-gray-200 font-bold"><?php echo $item['text']; ?></span>
      </a>
    <?php endforeach; ?>
  </div>
</div>