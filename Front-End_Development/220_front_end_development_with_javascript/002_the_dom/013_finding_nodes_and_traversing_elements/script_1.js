// Write JavaScript code to retrieve how many words are in each h2 heading in the page.

var headers = document.querySelectorAll('h2');
var wordCount = [];

for (var i = 0; i < headers.length; i++) {
  wordCount.push(headers[i].textContent.split(' ').length);
}