// script.js

$(function() {
  $("input[type=checkbox]").change(function(e) {
    e.preventDefault();
    var $checkbox = $(this);

    var $items = $("#titles li[data-console='" + $checkbox.data("console") + "']");
    
    if ($checkbox.prop("checked")) {
      $items.show();
    } else {
      $items.hide();
    }
  })
});