// wikipedia.js

var totalImages = 0;
var totalPNGImages = 0

function walk(node, callback) {
  
  callback(node);
  
  for (var i = 0; i < node.childNodes.length; i++) {
    walk(node.childNodes[i], callback);
  }
}

walk(document, function(node) {
  if (node instanceof HTMLImageElement) {
    // Count the images in the page.
    var source = node.src;
    
    totalImages++;
    if (source.match(/png$/i)) {
      totalPNGImages++;
    }
  } else if (node instanceof HTMLAnchorElement) {
    node.style.color = 'Red';
  }
});

console.log(totalImages);
console.log(totalPNGImages);