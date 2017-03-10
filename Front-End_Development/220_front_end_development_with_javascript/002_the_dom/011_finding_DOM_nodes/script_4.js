// script_4.js

var divs = document.getElementsByClassName('intro');

for (var i = 0; i < divs.length; i++) {
  var paragraphs = divs[i].getElementsByTagName('p');
  
  for (var j = 0; j < paragraphs.length; j++) {
    paragraphs[j].classList.add('article-text');
  }
}

  