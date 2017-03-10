// script.js

var totalParagraphs = 0;
var firstWords = [];

function walk(node, callback) {
  
  callback(node);
  
  for (var i = 0; i < node.childNodes.length; i++) {
    walk(node.childNodes[i], callback);
  }
}

walk(document.childNodes[0], function(node) {
  if (node instanceof HTMLParagraphElement) {
    // Count the paragraphs in the page.
    totalParagraphs++;
    
    // Get the first word of the paragraph.
    firstWords.push(node.textContent.trim().split(' ')[0]);
    
    if (totalParagraphs > 1) {
      node.classList.add('stanza');
    }
  }
});

console.log(totalParagraphs);
console.log(firstWords);