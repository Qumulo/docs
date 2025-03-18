document.querySelectorAll('summary').forEach((summary) => {
  summary.addEventListener('click', function() {
    if (this.parentNode.open) {
      this.innerText = 'Click to expand';
    } else {
      this.innerText = 'Click to collapse';
    }
  });
});
