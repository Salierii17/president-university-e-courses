function dropdown() {
  var submenu = document.querySelector("#submenu");
  var arrow = document.querySelector("#arrow");

  submenu.classList.toggle("hidden");
  arrow.classList.toggle("rotate-180");

  // Check if the submenu is visible after toggling
  var isSubmenuVisible = !submenu.classList.contains("hidden");

  // If the submenu is visible, disable scrolling on the body to prevent scrolling underneath the dropdown
  if (isSubmenuVisible) {
    document.body.style.overflow = "hidden";
  } else {
    // If the submenu is hidden, restore the default scrolling behavior
    document.body.style.overflow = "auto";
  }
}
dropdown();

// Initial call to the dropdown function

function dropdown2(topicId) {
  document.querySelector("#submenu2" + topicId).classList.toggle("hidden");
  document.querySelector("#arrow2" + topicId).classList.toggle("rotate-90");
}


function openSidebar() {
  document.querySelector(".sidebar").classList.toggle("hidden");
}

// Initialize Video.js
function seekToTime(time) {
  var player = videojs("my-video");
  player.currentTime(time);
}
