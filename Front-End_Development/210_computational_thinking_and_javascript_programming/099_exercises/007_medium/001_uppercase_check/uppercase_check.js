// Uppercase check

function isUppercase(string) {
  var result = string.split('').reduce(function(result, char) {
    return char.toUpperCase() === char ? result && true : result && false;
  }, true);
  
  return result;
}

// Clever way
// function isUppercase(string) {
//   return !string.match(/[a-z]/g);
// }

console.log(isUppercase('t'));          // false
console.log(isUppercase('T'));          // true
console.log(isUppercase('Four Score')); // false
console.log(isUppercase('FOUR SCORE')); // true
console.log(isUppercase('4SCORE!'));    // true
console.log(isUppercase(''));           // true