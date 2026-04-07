// Expand left sidebar menu on page load
window.addEventListener("DOMContentLoaded", (event) => {
    var secondListItem = document.querySelector("#mysidebar > li:nth-child(2)");
    if (secondListItem) {
        secondListItem.classList.add("active");
    }
});
