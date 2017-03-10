// script.js

$(function() {
  var canvas = document.querySelector("canvas");
  var ctx = canvas.getContext("2d")
  var shape = "";
  
  $("a[data-shape=circle]").on("click", function(e) {
    e.preventDefault();
    $a = $(e.target);
    
    $("a.active").removeClass("active");
    $a.addClass("active");
    shape = "circle";
  });
  
  $("a[data-shape=rectangle]").on("click", function(e) {
    e.preventDefault();
    $a = $(e.target);
    
    $("a.active").removeClass("active");
    $a.addClass("active");
    shape = "rectangle";
  });
  
  $("a[data-shape=triangle]").on("click", function(e) {
    e.preventDefault();
    $a = $(e.target);
    
    $("a.active").removeClass("active");
    $a.addClass("active");
    shape = "triangle";
  });
  
  $("a[data-shape=clear]").on("click", function(e) {
    e.preventDefault();
    ctx.clearRect(0, 0, canvas.width, canvas.height);
  });
  
  $("input[type=text]").on("blur", function(e) {
    e.preventDefault();
    
    ctx.fillStyle = $(e.target).val();
  })
  
  $("canvas").on("click", function(e) {
    e.preventDefault();
    $canvas = $(e.target);
    x = e.offsetX;
    y = e.offsetY;

    if (shape === "circle") {
      ctx.beginPath();
      ctx.arc(x, y, 20, 0, 2 * Math.PI);
      ctx.fill();
      ctx.closePath();
    } else if (shape === "rectangle") {
      ctx.fillRect(x - 20, y - 20, 40, 40);
    } else if (shape === "triangle") {
      ctx.beginPath();
      ctx.moveTo(x - 20, y + 20);
      ctx.lineTo(x, y - 20);
      ctx.lineTo(x + 20, y + 20);
      ctx.lineTo(x - 20, y + 20);
      ctx.fill();
      ctx.closePath();
    }
  })
  
  $("form").on("submit", function(e) {
    e.preventDefault();
  })
});