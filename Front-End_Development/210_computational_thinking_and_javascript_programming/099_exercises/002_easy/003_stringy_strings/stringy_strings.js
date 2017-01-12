// Stringy Strings

function stringy(number) {
  var string = '';
  
  for (var i = 0; i < number; i++) {
    if (i % 2 === 0) {
      string = string + '1';
    } else {
      string = string + '0';
    }
  }
  
  return string;
}

console.log(stringy(6)); // '101010'
console.log(stringy(9)); // '101010101'
console.log(stringy(4)); // '1010'
console.log(stringy(7)); // '1010101'