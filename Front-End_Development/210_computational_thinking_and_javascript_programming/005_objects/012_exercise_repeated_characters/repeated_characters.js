// Repeated characters

// Implement a function that takes a string as an argument and returns an object
// containing the count of repeated characters.

function repeatedCharacters(string) {
  var obj = {};
  for (var i = 0; i < string.length; i++) {
    if (string[i] in obj) {
      obj[string[i]]++;
    } else if (string.indexOf(string[i]) !== string.lastIndexOf(string[i])) {
      obj[string[i]] = 1;
    }
  }
  return obj;
}

console.log(repeatedCharacters('Programming'));    // { r: 2, g: 2, m: 2 }
console.log(repeatedCharacters('Combination'));    // { o: 2, i: 2, n: 2 }
console.log(repeatedCharacters('Pet'));            // {}
console.log(repeatedCharacters('Paper'));          // { p: 2 }
console.log(repeatedCharacters('Baseless'));       // { s: 3, e: 2 }