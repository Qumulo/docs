document.addEventListener("DOMContentLoaded", function() {
  const element = document.getElementById('description');

  if (element) {
    const regex = /(\s–)(\w+)/g;

    let innerHTML = element.innerHTML;

    innerHTML = innerHTML.replace(regex, function(match, p1, p2) {
      return ' <code>--' + p2 + '</code>';
    });

    element.innerHTML = innerHTML;
  }
});
