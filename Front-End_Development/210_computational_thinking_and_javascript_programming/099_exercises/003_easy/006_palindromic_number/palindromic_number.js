// Palindromic Number

function isPalindromicNumber(number) {
  var numberToString = number.toString();
  
  return numberToString === numberToString.split('').reverse().join('');
}

console.log(isPalindromicNumber(34543));        // true
console.log(isPalindromicNumber(123210));       // false
console.log(isPalindromicNumber(22));           // true
console.log(isPalindromicNumber(5));            // trueconsole.log()