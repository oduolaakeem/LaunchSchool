// script.js

var $p = $('p');

$p.parent('.highlight').css('color', 'blue');

$('#javascript').closest('ul').addClass('categories');

$('#javascript').parents('ul').addClass('categories');

console.log($('ul#navigation').find('li').length);
console.log($('ul#navigation').children().length);

// Find all list items after the CSS list item and hide them
var $css = $('#css').closest('li');
$css.nextAll().hide();

// Find all list items before the CSS list item and hide them
$css.prevAll().hide();

// Find all sibling lis and show them
$css.siblings().show();