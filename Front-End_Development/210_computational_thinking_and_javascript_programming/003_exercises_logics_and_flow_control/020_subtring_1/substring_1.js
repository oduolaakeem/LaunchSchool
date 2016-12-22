// Substring 1

function substr(string, start, length) {
  var new_string = '';
  
  if (length <= 0 || string === '') {
    return "";
  } else if (start < 0) {
    for (var i = string.length + start; i < string.length + start + length; i++) {
      if (i >= string.length) {
        break;
      }
      new_string += string[i];
    }
  } else {
    for (var i = start; i < start + length; i++) {
      if (i >= string.length) {
        break;
      }
      new_string += string[i];
    }
  }
  return new_string;
}

var string = 'hello world';

console.log(substr(string, 2, 4));     // "llo "
console.log(substr(string, -3, 2));    // "rl"
console.log(substr(string, 8, 20));    // "rld"
console.log(substr(string, 0, -20));   // ""
console.log(substr(string, 0, 0));     // ""