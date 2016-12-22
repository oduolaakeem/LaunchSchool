// Combining abstractions

var names = ['Heather', 'Gisella', 'Katsuki', 'Hua', 'Katy', 'Kathleen', 'Otakar'];
var letters = names.map(function(name) {
  return name[0];
});

console.log(letters);

var counts = letters.reduce(function(obj, letter) {
  obj[letter] = obj[letter] || 0;
  obj[letter] += 1;
  return obj;
}, {});

console.log(counts);

var letter = Object.keys(counts).reduce(function(lastLetter, currentLetter) {
  if (counts[lastLetter] > counts[currentLetter]) {
    return lastLetter;
  } else {
    return currentLetter;
  }
});

console.log(letter);