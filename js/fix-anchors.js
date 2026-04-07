window.addEventListener('load', function() {
  if (window.location.hash) {
    const target = document.querySelector(window.location.hash);
    if (target) {
      target.scrollIntoView();
    }
  }
});

window.addEventListener('hashchange', function() {
  const target = document.querySelector(window.location.hash);
  if (target) {
    target.scrollIntoView();
  }
});
