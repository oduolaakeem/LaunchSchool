// q13.js


function findItems() {
  var checkBoxes = Array.prototype.slice.call(document.querySelectorAll('input[type="checkbox"]'));
  var checked = [];
  var unchecked = [];
  
  checkBoxes.forEach(function(input) {
    if (input.checked) {
      checked.push(input.nextElementSibling.textContent);
    } else {
      unchecked.push(input.nextElementSibling.textContent);
    }
  });
  
  return [checked, unchecked];
};



