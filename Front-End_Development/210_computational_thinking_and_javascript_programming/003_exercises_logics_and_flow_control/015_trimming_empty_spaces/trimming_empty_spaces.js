// Trimming Empty Spaces

function trim(string) {
  var first_index;
  var last_index;
  var output_string = '';
  
  for (var i = 0; i < string.length; i++) {
    if (string[i] != ' ') {
      first_index = i;
      break;
    }
  }
  
  for (var i = string.length - 1; i >= 0; i--) {
    if (string[i] != ' ') {
      last_index = i;
      break;
    }
  }
  
  for (var i = first_index; i <= last_index; i++) {
    output_string += string[i];
  }
  
  return output_string;
}

console.log(trim('  abc  '));
console.log(trim('abc   '));
console.log(trim(' ab c'));
console.log(trim(' a b  c'));
console.log(trim('      '));
console.log(trim(''));