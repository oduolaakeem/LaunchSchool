// script_2.js

function walk(node, callback) {
  callback(node);
  
  node.childNodes.forEach(function(child) {
    walk(child, callback);
  });
}

function getElementsByTagName(tagName) {
  var result = [];
  
  walk(document, function(child) {
    if (child.nodeName.toLowerCase() === tagName) {
      result.push(child);
    }
  });
  
  return result;
}

getElementsByTagName('p').forEach(function(paragraph) {
  paragraph.classList.add('article-text');
});