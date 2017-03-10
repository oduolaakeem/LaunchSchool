// script.js

$(function() {
  var myStorage = window.localStorage;
  var speed = 400;
  
  checkStartSettings();
  addEventListeners();
  
  function addEventListeners() {
    $("nav").on("click", "a", function(e) {
      e.preventDefault();
      var $a = $(e.target);
      var $current_article = $("article:visible");
      var $current_id = $current_article.data("id");
      
      if ($a.data("id") !== $current_id) {
        $current_article.slideUp(speed);
        findArticle($a.data("id")).delay(speed).slideDown(speed);
        $("nav a.active").toggleClass("active");
        $a.toggleClass("active");
      }
      
      myStorage.setItem("tab", $a.data("id"));
    });
    
    $("fieldset ul").on("click", "input", function(e) {
      var color = $(e.target).val();
      
      $("body").css("background", color);
      myStorage.setItem("backgroundColor", color);
    });
    
    $(window).unload(function(e) {
      var $textarea = $("textarea[name=note]");
      
      myStorage.setItem("note", $textarea.val());
    });
  }
  
  function checkStartSettings() {
    var tabId = myStorage.getItem("tab");
    var color = myStorage.getItem("backgroundColor");
    var note = myStorage.getItem("note");
    
    $("#tabs article").hide();
    findArticle(tabId).show();
    $("nav a.active").toggleClass("active");
    $("nav a").each(function() {
      if ($(this).data("id") === +tabId) {
        $(this).toggleClass("active")
      }
    })
    
    $("body").css("background", color);
    $("fieldset ul input").filter(function(idx, elem) {return $(elem).val() === color}).attr("checked", true);
    
    $("textarea[name=note]").val(note);
  }
  
  function findArticle(id) {
    return $("#tabs article").filter(function(i, article) {
        return $(article).data("id") === +id;
    })
  }
});