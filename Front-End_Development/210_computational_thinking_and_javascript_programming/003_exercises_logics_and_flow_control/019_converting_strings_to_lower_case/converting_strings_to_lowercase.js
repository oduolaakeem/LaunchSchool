// Converting strings to lowercase

function toLowerCase(string) {
  var stringLowerCase = '';
  var asciiCode;
  for (var i = 0; i < string.length; i++) {
    asciiCode = string.charCodeAt(i);
    if (asciiCode >= 65 && asciiCode <= 90) {
      stringLowerCase += String.fromCharCode(string.charCodeAt(i) + 32);  
    } else {
      stringLowerCase += string[i];
    }
    
  }
  return stringLowerCase;
}

console.log(toLowerCase('ALPHABET'));
console.log(toLowerCase('123'));
console.log(toLowerCase('abcDEF'));