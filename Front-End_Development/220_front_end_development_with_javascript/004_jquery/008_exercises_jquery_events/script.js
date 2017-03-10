// script.js

var charCode;

$(function() {
  var $form = $('form');
  var $accordion = $('#accordion');
  var $a = $('a');
  
  $form.submit(function(e) {
    e.preventDefault();
    
    charCode = $(this).find('input').val().charCodeAt(0);
  });
  
  $a.click(function(e) {
    e.preventDefault();
    
    $('#accordion').slideToggle();
  })
  
  $(document).off('keypress').on('keypress', function(e) {
    if (e.which !== charCode) {
      return;
    }
  
    $a.trigger('click');
  });
});

