// All Substrings

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

console.log(substrings('abcde'));
// result
// [ 'a', 'ab', 'abc', 'abcd', 'abcde',
//   'b', 'bc', 'bcd', 'bcde',
//   'c', 'cd', 'cde',
//   'd', 'de',
//   'e' ]