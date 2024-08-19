<?php
function navigate($direction) {
    // Example logic for navigation
    $pages = ['page1.php', 'page2.php', 'page3.php'];
    $currentPage = basename($_SERVER['PHP_SELF']);
    $currentIndex = array_search($currentPage, $pages);

    if ($direction === 'prev') {
        $newIndex = ($currentIndex - 1 + count($pages)) % count($pages);
    } elseif ($direction === 'next') {
        $newIndex = ($currentIndex + 1) % count($pages);
    }

    header('Location: ' . $pages[$newIndex]);
    exit();
}

if (isset($_GET['direction'])) {
    navigate($_GET['direction']);
}
?>