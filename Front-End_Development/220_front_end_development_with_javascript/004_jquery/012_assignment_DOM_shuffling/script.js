// script.js

$(function () {
  var $header = $("body > header");
  var $header_h1 = $("main > h1");
  var $main = $("body > main");
  var $figures = $("main figure");
  
  $main.before($header);
  $header.find("nav").before($header_h1);
  $main.find("article").append($figures.last());
  $main.find("article").append($figures.first());
});