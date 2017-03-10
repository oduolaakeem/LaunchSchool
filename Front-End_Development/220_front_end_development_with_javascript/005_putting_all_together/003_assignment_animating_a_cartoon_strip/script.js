// script.js

$(function() {
  var $blinds = $("[id^='blind']"),
      speed = 250,
      delay = 1500;
  
  function startAnimation() {
    $blinds.each(function(i) {
      var $blind = $blinds.eq(i);
      
      $blind.delay((i * delay) + speed);  
      $blind.animate({
        top: "+=" + $(this).height(),
        height: 0,
      }, speed);
    });
  }
  
  $("a").click(function(e) {
    e.preventDefault();
    
    $blinds.finish();    
    $blinds.removeAttr("style");
    startAnimation();
  });
  
  startAnimation();
});