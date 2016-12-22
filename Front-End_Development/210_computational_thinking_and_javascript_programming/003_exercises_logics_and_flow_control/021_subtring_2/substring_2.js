// Substring 2

function substring(string, start, end) {
  var newString = '';
  
  // Validating arguments
  if (string === '' || (start === 0 && end === 0)) {
    return '';
  } else if (start < 0 || end < 0 || isNaN(start) || isNaN(end)) {
    if (start < 0 || isNaN(start)) {
      start = 0;
    }
    
    if (end === undefined) {
      end = string.length;
    } else if (end < 0 || isNaN(end)) {
      end = 0;
    }
  } else if (start >= string.length || end >= string.length) {
    if (start >= string.length) {
      start = string.length - 1;
    }
    
    if (end >= string.length) {
      end = string.length;
    }
  } else if (end === undefined) {
    end = string.length;
  }
  
  if (start > end) {
    var temp = start;
    start = end;
    end = temp;
  }
  
  for (var i = start; i < end; i++) {
    newString += string[i];
  }
  
  return newString;
}

var string = 'hello world';

console.log(substring(string, 2, 4));
console.log(substring(string, 4, 2));
console.log(substring(string, 0, -1));
console.log(substring(string, 2));
console.log(substring(string, 'a'));
console.log(substring(string, 8, 20));