// Leading Substrings

function substringsAtStart(string) {
  // My solution
  // var result = [];
  
  // for (var i = 1; i <= string.length; i++) {
  //   result.push(string.substring(0, i));
  // }
  
  // return result;
  return string.split('').map(function(currentValue, index, array) {
    return array.slice(0, index + 1).join('');
  })
}

console.log(substringsAtStart('abc'));  // ['a', 'ab', 'abc']
console.log(substringsAtStart('a'));     // ['a']
console.log(substringsAtStart('xyzzy')); // ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']