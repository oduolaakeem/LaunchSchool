// script.js

// set up variables
// 

$(function() {
  // variables
  var value1;
  var value2;
  var operation;
  
  // elements
  var $p = $("#result");
  var $value1 = $("input[name='value1']");
  var $value2 = $("input[name='value2']");
  var $operation = $("select");
  var $form = $("form");
  
  $form.submit(function(e) {
    e.preventDefault();
    
    value1 = parseFloat($value1.val());
    value2 = parseFloat($value2.val());
    operation = $operation.find(':selected').text();
    
    if (operation === '+') {
      $p.text(value1 + value2);
    } else if (operation === '-') {
      $p.text(value1 - value2);
    } else if (operation === 'x') {
      $p.text(value1 * value2);
    } else if (operation === '/') {
      $p.text((value1 / value2).toFixed(2));
    }
  });
});