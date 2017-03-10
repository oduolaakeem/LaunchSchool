// script.js

function displayAlert(event) {
  event.preventDefault();
  
  var message = document.getElementById('message').value;
  alert(message);
}

document.addEventListener('DOMContentLoaded', function(e) {
  var button = document.getElementById('alert');
  button.addEventListener('click', displayAlert);
})