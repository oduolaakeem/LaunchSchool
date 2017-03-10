// The scientific classification of an animal can be thought of as a series of 
// key-value pairs, where the keys are the taxonomic ranks 
// (Domain, Kingdom, Phylum, Class, Order, Family, Genus, and Species) and the values are the 
// specific group that animal belongs to for that rank.

// The webpage includes this information on the page. Write a JavaScript function
// that will extract this information from the page and return an Object with the
// taconomic ranks as keys and the animal's classification for that rank as values.

var tds = document.querySelectorAll('table.infobox td');

var classification = {Kingdom: '', Phylum: '', Class: '', Order: '', Family: '', Genus: '', Species: ''};
var classificationKeys = Object.keys(classification);

for (var i = 0; i < tds.length; i++) {
  classificationKeys.forEach(function(rank) {
    if (tds[i].textContent.trim().match(new RegExp(rank))) {
      classification[rank] = tds[i].nextElementSibling.textContent.trim();
    }
  });
}

console.log(classification);
