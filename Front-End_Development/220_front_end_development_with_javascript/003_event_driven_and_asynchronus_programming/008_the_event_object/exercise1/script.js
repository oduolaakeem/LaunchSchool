// script1.js

document.addEventListener('DOMContentLoaded', function(event) {
  document.addEventListener('click', function(e) {
    var xDiv = document.querySelector('div.x');
    xDiv.style.left = e.clientX + 'px';
    xDiv.style.top = e.clientY + 'px';
  })
})