// script.js

$(function() {
  var $p = $('p');
  var output = 'Your favourite fruit is ';
  
  $('a').click(function(e) {
    e.preventDefault();
    var $e = $(this);
    
    $p.text(output + $e.text());
  });
  
  $('form').submit(function(e) {
    e.preventDefault();
    var $input = $(this).find('[type="text"]');
    
    $p.text('Your favourite fruit is ' + $input.val());
  });
});