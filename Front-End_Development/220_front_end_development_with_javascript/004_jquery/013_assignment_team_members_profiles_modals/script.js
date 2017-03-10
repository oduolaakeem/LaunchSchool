// script.js

$(function() {
  var $modals = $(".modal");
  var $overlays = $(".overlay");
  var $links = $("#team li > a");
  var $close_links = $(".modal > a");
  
  $modals.hide();
  $overlays.hide();
  
  $links.each(function() {
    $(this).click(function(e) {
      e.preventDefault();
      $(e.target).closest("a").nextAll("div.modal").css("top", $(window).scrollTop() + 20);
      $(e.target).closest("a").nextAll("div").fadeIn("slow");
    });
  })
  
  $close_links.each(function() {
    $(this).click(closeModal);
  })
  
  $overlays.each(function(){
    $(this).click(closeModal);
  });
  
  $(document).keydown(function(e) {
    if (e.which === 27) {
      $overlays.first().trigger("click");
    }
  });
  
  function closeModal(e) {
    e.preventDefault();
    $modals.fadeOut("slow");
    $overlays.fadeOut("slow");
  }
})

