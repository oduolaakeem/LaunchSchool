// Palindromic Substrings

function palindromes(string) {
  return substrings(string).filter(function(value) {
    return isPalindrome(value);
  });
}

function isPalindrome(string) {
  if (string.length >= 2) {
    if (string.split('').reverse().join('') === string) {
      return true
    }
  }
  return false;
}


function substringsAtStart(string) {
  return string.split('').map(function(currentValue, index, array) {
    return array.slice(0, index + 1).join('');
  })
}

function substrings(string) {
  return string.split('').reduce(function(result, currentValue, index, array) {
    return result.concat(substringsAtStart(array.slice(index, array.length).join('')));
  }, []);
}

console.log(palindromes('abcd'));  // []
console.log(palindromes('madam')); // ['madam', 'ada']
console.log(palindromes('hello-madam-did-madam-goodbye'));
// result
// [ 'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
//   'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
//   '-madam-', 'madam', 'ada', 'oo' ]

console.log(palindromes('knitting cassettes'));
// result
// [ 'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt' ]