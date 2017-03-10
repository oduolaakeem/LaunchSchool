// script1.js

document.addEventListener('DOMContentLoaded', function(event) {
  document.addEventListener('mousemove', function(e) {
    var xDiv = document.querySelector('div.x');
    xDiv.style.left = e.clientX + 'px';
    xDiv.style.top = e.clientY + 'px';
  });
  
  document.addEventListener('keypress', function(e) {
    var horizontal = document.querySelector('div.horizontal');
    var vertical = document.querySelector('div.vertical');
    
    if (e.key === 'b') {
      horizontal.style.background = 'blue';
      vertical.style.background = 'blue';
    } else if (e.key === 'g') {
      horizontal.style.background = 'green';
      vertical.style.background = 'green';
    } else if (e.key === 'r') {
      horizontal.style.background = 'red';
      vertical.style.background = 'red';
    }
  });
});