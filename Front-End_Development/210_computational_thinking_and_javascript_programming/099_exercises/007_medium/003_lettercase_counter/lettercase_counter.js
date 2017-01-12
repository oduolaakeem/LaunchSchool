// Lettercase Counter

function letterCaseCount(string) {
  var result = {};

  result.lowercase = !!string.match(/[a-z]/g) ? string.match(/[a-z]/g).length : 0;
  result.uppercase = !!string.match(/[A-Z]/g) ? string.match(/[A-Z]/g).length : 0;
  result.neither = !!string.match(/[^a-zA-Z]/g) ? string.match(/[^a-zA-Z]/g).length : 0;

  return result;
}

console.log(letterCaseCount('abCdef 123')); // { lowercase: 5, uppercase: 1, neither: 4 }
console.log(letterCaseCount('AbCd +Ef'));   // { lowercase: 3, uppercase: 3, neither: 2 }
console.log(letterCaseCount('123'));        // { lowercase: 0, uppercase: 0, neither: 3 }
console.log(letterCaseCount(''));           // { lowercase: 0, uppercase: 0, neither: 0 }