// script.js

// Get elements from the DOM
// Validate the number of items
// Create li object with quantity and item

$(function() {
  var $item = $("input[name=item]");
  var $quantity = $("input[name=quantity]");
  var $list = $("ul#groceries-list");
  
  var quantity;

  $('form').submit(function(e) {
    e.preventDefault();
    
    quantity = parseFloat($quantity.val()) || 1;
    
    $list.append("<li>" + quantity + " " + $item.val() + "</li>");
    this.reset();
  })
});