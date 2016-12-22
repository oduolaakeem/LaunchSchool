// Repeating strings

function repeat(string, times) {
  
  if (times < 0 || Number(times) !== times) {
    return undefined;
  } else if (times == 0) {
    return '';
  } else {
    for (var i = 0; i < times; i++) {
      string += string;
    }
  }
  return string;
}

console.log(repeat('abc', 1));
console.log(repeat('abc', 2));
console.log(repeat('abc', -1));
console.log(repeat('abc', 0));
console.log(repeat('abc', 'a'));