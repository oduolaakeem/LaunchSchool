// Ascii value of string

function asciiValue(string) {
  return string.split('').reduce(function(a, b) {
    return a + b.charCodeAt(0);
  }, 0);
}

console.log(asciiValue('Four score'));         // 984
console.log(asciiValue('Launch School'));      // 1251
console.log(asciiValue('a'));                  // 97
console.log(asciiValue(''));                   // 0