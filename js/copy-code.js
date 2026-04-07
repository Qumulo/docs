document.addEventListener('DOMContentLoaded', function () {
  document.querySelectorAll('pre code').forEach(function (codeBlock) {
    var button = document.createElement('button');
    button.className = 'btn btn-xs btn-default copy-btn';
    button.innerHTML = '<i class="fa fa-copy"></i>';
    button.title = 'Copy to clipboard';

    var pre = codeBlock.parentNode;
    pre.style.position = 'relative';
    pre.insertBefore(button, codeBlock);

    button.addEventListener('click', function () {
      var text = codeBlock.innerText;

      if (navigator.clipboard) {
        navigator.clipboard.writeText(text).then(success);
      } else {
        var ta = document.createElement('textarea');
        ta.value = text;
        document.body.appendChild(ta);
        ta.select();
        document.execCommand('copy');
        document.body.removeChild(ta);
        success();
      }

      function success() {
        button.innerHTML = '<i class="fa fa-check"></i>';
        setTimeout(function () {
          button.innerHTML = '<i class="fa fa-copy"></i>';
        }, 2000);
      }
    });
  });
});
