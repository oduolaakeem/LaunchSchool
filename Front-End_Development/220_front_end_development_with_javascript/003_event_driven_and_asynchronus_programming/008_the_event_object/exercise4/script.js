// script.js

document.addEventListener('DOMContentLoaded', function(event) {
  var textarea = document.querySelector('div textarea');
  var button = document.querySelector('div button');
  var p = document.querySelector('div p');
  const MAX_LENGTH = 140;
  
  p.textContent = MAX_LENGTH + ' characters remaining';
  
  textarea.addEventListener('keyup', function(e) {
    p.textContent = (MAX_LENGTH - this.value.length) + ' characters remaining';
    
    if (this.value.length > MAX_LENGTH) {
      this.setAttribute('class', 'invalid')
      button.disabled = true;
    } else {
      this.removeAttribute('class', 'invalid');
      button.disabled = false;
    }
  });
})