// String starts with

function startsWith(string, searchString) {
  var same = true;
  if (searchString.length <= string.length) {
    for (var i = 0; i < searchString.length; i++) {
      if (string[i] !== searchString[i]) {
        same = false;
        break;
      }
    }
    return same;    
  }
  return false;
}

var str = 'We put comprehension and mastery above all else';
console.log(startsWith(str, 'We'));
console.log(startsWith(str, 'We put'));
console.log(startsWith(str, ''));
console.log(startsWith(str, 'put'));

var longerString = 'We put comprehension and mastery above all else!';
console.log(startsWith(str, longerString));