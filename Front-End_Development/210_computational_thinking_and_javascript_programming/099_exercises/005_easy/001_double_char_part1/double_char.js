// Double Char

function repeater(string) {
  return string.split('').reduce(function(acum, value) {
    return acum + value + value;
  }, '');
}

console.log(repeater('Hello'));     // "HHeelllloo"
console.log(repeater("Good job!")); // "GGoooodd  jjoobb!!"
console.log(repeater(''));          // ''