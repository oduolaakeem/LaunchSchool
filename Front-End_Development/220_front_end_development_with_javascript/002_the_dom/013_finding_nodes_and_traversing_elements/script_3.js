// Write JavaScript code to color every other link in the table of contents green.

var links = document.querySelectorAll('#toc a');

for (var i = 0; i < links.length; i++) {
  links[i].style.color = 'Green';
}