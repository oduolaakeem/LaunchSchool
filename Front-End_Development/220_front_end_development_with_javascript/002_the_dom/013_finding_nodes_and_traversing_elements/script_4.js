// Write JavaScript code to retrieve the text of every thumbnail caption on the page.

var thumbnailsDivs = document.querySelectorAll('div.thumbcaption');
var thumbnailsText = [];

for (var i = 0; i < thumbnailsDivs.length; i++) {
  thumbnailsText.push(thumbnailsDivs[i].textContent.trim());
}

console.log(thumbnailsText);