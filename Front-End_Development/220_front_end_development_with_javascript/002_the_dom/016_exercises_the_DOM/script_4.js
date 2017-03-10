// script_4.js

// script_2.js

var linkListener = function(event) {
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

var divListener = function(event) {
  event.preventDefault();

  this.setAttribute('class', 'hidden');
}

document.getElementById('toggle').addEventListener('click', linkListener);
document.getElementById('notice').onclick = divListener;