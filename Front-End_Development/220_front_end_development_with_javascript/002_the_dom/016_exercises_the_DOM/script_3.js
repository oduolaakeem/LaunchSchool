// script_2.js

var listener = function(event) {
  event.preventDefault();
  
  var div = document.getElementById('notice');
  
  if (div.classList.contains('hidden')) {
    div.classList.remove('hidden');
    div.classList.add('visible');
  } else {
    div.classList.remove('visible');
    div.classList.add('hidden');
  }
};

document.getElementById('toggle').addEventListener('click', listener);