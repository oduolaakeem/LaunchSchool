// Double Char Part 2

function doubleConsonants(string) {
  return string.split('').reduce(function(acum, value) {
    value.match(/[aeiou0-9]/) ? acum = acum + value : acum = acum + value + value;
    return acum;
  }, '');
}

console.log(doubleConsonants('String'));       // "SSttrrinngg"
console.log(doubleConsonants('Hello-World!')); // "HHellllo-WWorrlldd!"
console.log(doubleConsonants('July 4th'));     // "JJullyy 4tthh"
console.log(doubleConsonants(''));             // ""