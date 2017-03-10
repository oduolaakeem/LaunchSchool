// q16.js

var h1 = document.createElement('h1');
var div = document.querySelector('div');
h1.textContent = "The Day's News";

document.body.insertBefore(h1, div);
document.body.removeChild(document.querySelector('h2'));

var article = document.createElement('article');
var p1 = document.createElement('p');
var p2 = document.createElement('p');
var a = document.createElement('a');

article.setAttribute('class', 'breaking');
p1.textContent = "This evening a fire took place in the old factory.";
a.setAttribute('href', "/stories/15");
a.textContent = "Read More";

article.appendChild(p1);
p2.appendChild(a);
article.appendChild(p2);

div.insertBefore(article, div.querySelector('p'));
