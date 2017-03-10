// script_4_using_querySelector.js

var paragraphs = document.querySelectorAll('.intro p');

for (var i = 0; i < paragraphs.length; i++) {
  paragraphs[i].classList.add('article-text');
}