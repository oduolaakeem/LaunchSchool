// script.js

$(function() {
  var $figures = $("#column > figure");
  var $thumbnails = $("#thumbnails img");
  
  $thumbnails.click(function(e) {
    e.preventDefault();
    var $currentFigure = $figures.filter(":visible");
    var $clicked = $(e.target);
    
    if ($clicked.attr("src") !== $currentFigure.find("img").attr("src")) {
      $thumbnails.filter(".selected").toggleClass("selected");
      
      $(this).toggleClass("selected");
      var $newFigure = $figures.filter(function() {
        return $(this).find("img").attr("src") === $clicked.attr("src");
      });
      
      $currentFigure.fadeOut(400, function() {
        $newFigure.fadeIn(400);
      });
    }
  })
});