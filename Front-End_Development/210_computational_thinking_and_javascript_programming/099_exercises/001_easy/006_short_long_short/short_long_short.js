// Short Long Short

function shortLongShort(string1, string2) {
  if (string1.length <= string2.length) {
    console.log(string1 + string2 + string1);
  } else {
    console.log(string2 + string1 + string2);
  }
}

console.log(shortLongShort('abc', 'defgh'));   // "abcdefghabc"
console.log(shortLongShort('abcde', 'fgh'));   // "fghabcdefgh"
console.log(shortLongShort('', 'xyz'));        // "xyz"