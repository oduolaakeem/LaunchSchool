// script.js

$(function() {
  $("form").submit(function(e) {
    e.preventDefault();
    
    var $div = $("<div></div>")
    
    $div.addClass($("form input[name=shape]").filter(":checked").val());
    
    $div.data({
      'start-x': $("#start-x").val(),
      'start-y': $("#start-y").val(),
      'end-x': $("#end-x").val(),
      'end-y': $("#end-y").val()
    });
    
    $div.css({
      top: parseInt($("#start-y").val()),
      left: parseInt($("#start-x").val())
    });
    
    $("#canvas").append($div);
  });
  
  $("#start-animation").click(function(e) {
    e.preventDefault();
    var speed = 1500;
    
    $("#canvas").children().each(function() {
      var $div = $(this).stop();

      $div.css({
        top: parseInt($div.data("start-y")),
        left: parseInt($div.data("start-x"))
      })

      $div.animate({
        top: $div.data("end-y"),
        left: $div.data("end-x")
      }, speed);
    });
  });
  
  $("#stop-animation").click(function(e) {
    e.preventDefault();
    $("#canvas div").stop();
  })
});