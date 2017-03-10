// q15.js

function walkList() {
  var listElements = Array.prototype.slice.call(document.getElementsByTagName('li'));
  
  listElements.forEach(function(list) {
    console.log(list.firstChild.textContent.trim());
  });
};