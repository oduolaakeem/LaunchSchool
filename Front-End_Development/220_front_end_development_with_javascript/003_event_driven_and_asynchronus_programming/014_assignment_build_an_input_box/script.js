// script.js

document.addEventListener('DOMContentLoaded', function() {
  var textField = document.querySelector('div.text-field');
  var content = document.querySelector('div.content');
  var textCursorIntervalID;
  
  document.addEventListener('click', function(event) {
    if (event.target.tagName === 'DIV') {
      textField.classList.add('focused');
      textCursorIntervalID = setInterval(function() { 
        textField.classList.toggle('cursor') 
      }, 500);
    } else {
      clearInterval(textCursorIntervalID);
      textField.classList.remove('focused', 'cursor');
    }
  });
  
  document.addEventListener('keyup', function(event) {
    event.stopPropagation();
    
    if (textField.classList.contains('focused')) {
      if (event.key.length === 1) {
        content.textContent = content.textContent + event.key;
      } else if (event.key === 'Backspace') {
        content.textContent = content.textContent.slice(0, content.textContent.length - 1);
      }
    }
  });
});

