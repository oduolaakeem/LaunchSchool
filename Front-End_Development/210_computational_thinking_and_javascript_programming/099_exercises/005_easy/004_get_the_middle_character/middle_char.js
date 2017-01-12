// Middle Char

function centerOf(string) {
  var length = string.length;
  
  if (length % 2 === 0) {
    return string.slice((length / 2) - 1, (length / 2) + 1);
  } else {
    return string.charAt(Math.floor(length / 2));
  }
}

console.log(centerOf('I love ruby'));    // 'e'
console.log(centerOf('Launch School'));  // ' '
console.log(centerOf('Launch'));         // 'un'
console.log(centerOf('Launchschool'));   // 'hs'
console.log(centerOf('x'));              // 'x'