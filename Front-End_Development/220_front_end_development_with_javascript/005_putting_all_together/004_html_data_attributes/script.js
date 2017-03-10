// script.js

$(function(){
  $("ul").click(function(e) {
    e.preventDefault();
    var $article = $("article:visible");
    var data = $(e.target).data("block");
    var speed = 250;
    
    if (data !== $($article).data("block")) {
      $("article:visible").slideUp(speed);
      $("article[data-block=" + data + "]").slideDown(speed);
    }
  })
});