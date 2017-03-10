// script.js

function findParagraphs() {
  var paragraphs = [];
  
  document.body.childNodes.forEach(function(node) {
    if (node.nodeName === 'P') {
      paragraphs.push(node);
    }
  });
  
  return paragraphs;
}