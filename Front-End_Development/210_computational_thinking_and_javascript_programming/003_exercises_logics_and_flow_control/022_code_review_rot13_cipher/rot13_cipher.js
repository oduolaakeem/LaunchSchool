// Rot13 Cipher

function rot13(string) {
  var cipherCode = ''
  var uppercaseAlphabet = doubleAlphabetArray(true);
  var lowercaseAlphabet = doubleAlphabetArray();
  
  for (var i = 0; i < string.length; i++) {
    var char = string[i];
    var index;
    if (isUppercase(char)) {
      index = uppercaseAlphabet.indexOf(char);
      cipherCode += uppercaseAlphabet[index + 13];
    } else if (isLowercase(char)) {
      index = lowercaseAlphabet.indexOf(char);
      cipherCode += lowercaseAlphabet[index + 13];
    } else {
      cipherCode += char;
    }
  }
  
  return cipherCode;
}

// Helper functions below this comment

function isLowercase(char) {
  var asciiCode = char.charCodeAt(0);
  if (asciiCode >= 97 && asciiCode <= 122) {
    return true;
  } else {
    return false;
  }
}

function isUppercase(char) {
  var asciiCode = char.charCodeAt(0);
  if (asciiCode >= 65 && asciiCode <= 90) {
    return true;
  } else {
    return false;
  }
}

function doubleAlphabetArray(isUppercase) {
  var array = [];
  if (isUppercase) {
    for (var i = 0; i < 26; i++) {
      array.push(String.fromCharCode(i + 65));
    }
  } else {
    for (var i = 0; i < 26; i++) {
      array.push(String.fromCharCode(i + 97));
    }
  }
  return array.concat(array);
}

console.log(rot13('Teachers open the door, but you must enter by yourself.'));
console.log(rot13(rot13('Teachers open the door, but you must enter by yourself.')));
