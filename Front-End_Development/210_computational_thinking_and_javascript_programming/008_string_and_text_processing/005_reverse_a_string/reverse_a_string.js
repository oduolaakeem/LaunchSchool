// Reverse a string

function reverse(string) {
  return string.split('').reverse().join('');
}

var s1 = 'hello';
var s2 = 'The quick brown fox';

console.log(reverse(s1));               // returns "olleh"
console.log(reverse(s2)); // returns "xof nworb kciuq ehT"

console.log(s1);
console.log(s2);