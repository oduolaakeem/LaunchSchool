// script.js

// set up variables
// 

document.addEventListener('DOMContentLoaded', function() {
  // variables
  var value1;
  var value2;
  var operation;
  
  // elements
  var $p = document.getElementById("result");
  var $value1 = document.querySelector("input[name='value1']");
  var $value2 = document.querySelector("input[name='value2']");
  var $operation = document.querySelector("select");
  var $form = document.querySelector("form");
  
  $form.addEventListener('submit', function(e) {
    e.preventDefault();
    
    value1 = parseFloat($value1.value);
    value2 = parseFloat($value2.value);
    operation = findOperationText($operation.children);

    if (operation === '+') {
      $p.textContent = value1 + value2;
    } else if (operation === '-') {
      $p.textContent = value1 - value2;
    } else if (operation === 'x') {
      $p.textContent = value1 * value2;
    } else if (operation === '/') {
      $p.textContent = (value1 / value2).toFixed(2);
    }
  });
});

function findOperationText(htmlCollection) {
  for (var i = 0; i < htmlCollection.length; i++) {
    if (htmlCollection[i].selected) {
      return htmlCollection[i].textContent;
    }
  }
}
