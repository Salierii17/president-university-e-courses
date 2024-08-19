function dropdown() {
    document.querySelector("#submenu").classList.toggle("hidden");
    document.querySelector("#arrow").classList.toggle("rotate-180");
}
  // Initial call to the dropdown function
dropdown();
function dropdown2() {
  document.querySelector("#submenu2").classList.toggle("hidden");
  document.querySelector("#arrow2").classList.toggle("rotate-90");
}
dropdown2(); // Initial call to the dropdown function

function openSidebar() {
document.querySelector(".sidebar").classList.toggle("hidden");
}