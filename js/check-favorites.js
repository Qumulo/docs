document.addEventListener('DOMContentLoaded', function() {
  var STORAGE_KEY = 'qumulo-favorites';
  var path = window.location.pathname;
  var star = document.getElementById('page-star');

  if (!star) return; // not on a page with a star

  function getFavorites() {
    try { return JSON.parse(localStorage.getItem(STORAGE_KEY)) || []; }
    catch(e) { return []; }
  }

  function saveFavorites(favs) {
    localStorage.setItem(STORAGE_KEY, JSON.stringify(favs));
  }

  function isFavorited(favs) {
    return favs.some(function(f) { return f.path === path; });
  }

  function renderStar(favs) {
    star.innerHTML = isFavorited(favs) ? '&#9733;' : '&#9734;';
    star.style.color = '#f5c518';
  }

  var favs = getFavorites();
  renderStar(favs);

  star.addEventListener('click', function() {
    var favs = getFavorites();
    if (isFavorited(favs)) {
      favs = favs.filter(function(f) { return f.path !== path; });
    } else {
      var title = document.querySelector('h1.post-title-main');
      favs.push({ path: path, title: title ? title.textContent.trim() : document.title });
    }
    saveFavorites(favs);
    renderStar(favs);
  });
});
