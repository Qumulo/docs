document.addEventListener('DOMContentLoaded', function() {
  var STORAGE_KEY = 'qumulo-favorites';
  var list = document.getElementById('fav-list');
  var empty = document.getElementById('fav-empty');
  if (!list || !empty) return;
  function getFavorites() {
    try { return JSON.parse(localStorage.getItem(STORAGE_KEY)) || []; }
    catch(e) { return []; }
  }
  var favs = getFavorites();
  if (favs.length === 0) return;
  empty.style.display = 'none';
  document.getElementById('fav-intro').style.display = 'block';
  favs.forEach(function(f) {
    var li = document.createElement('li');
    var a = document.createElement('a');
    a.href = f.path;
    a.textContent = f.title || f.path;
    var removeBtn = document.createElement('span');
    removeBtn.style.userSelect = 'none';
    removeBtn.innerHTML = ' <span class="fav-remove">&#10005;</span>';
    removeBtn.title = 'Remove from favorites';
    removeBtn.addEventListener('click', function() {
      var updated = getFavorites().filter(function(x) { return x.path !== f.path; });
      localStorage.setItem(STORAGE_KEY, JSON.stringify(updated));
      li.remove();
      if (document.querySelectorAll('#fav-list li').length === 0) {
        empty.style.display = '';
        document.getElementById('fav-intro').style.display = 'none';
      }
    });
    li.appendChild(a);
    li.appendChild(removeBtn);
    list.appendChild(li);
  });
});
