// Index of substring

function indexOf(firstString, secondString) {
  var i = 0;
  var equal_string;
  
  while (i + secondString.length <= firstString.length) {
    equal_string = true;  
    for (var j = 0; j < secondString.length; j++) {
      if (firstString[i + j] != secondString[j]) {
        equal_string = false;
      }
    }
    
    if (equal_string) {
      return i; 
    }
    
    i++;
  }
  return -1;
}

function lastIndexOf(firstString, secondString) {
  var index;
  firstString = firstString.split("").reverse().join("");
  secondString = secondString.split("").reverse().join("");
  
  index = indexOf(firstString, secondString);
  
  if (index == -1) {
    return index;
  } else {
    return firstString.length - secondString.length - index;
  }
}



console.log(indexOf('Some strings', 's'));
console.log(indexOf('Blue Whale', 'Whale'));
console.log(indexOf('Blue Whale', 'Blute'));
console.log(indexOf('Blue Whale', 'leB'));

console.log(lastIndexOf('Some strings', 's'));
console.log(lastIndexOf('Blue Whale, Killer Whale', 'Whale'));
console.log(lastIndexOf('Blue Whale, Killer Whale', 'all'));