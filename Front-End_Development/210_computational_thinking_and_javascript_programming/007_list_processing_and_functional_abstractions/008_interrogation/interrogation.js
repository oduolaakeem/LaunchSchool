// Interrogation.js

function myOwnEvery(array, func) {
  var result = true;
  
  for (var i = 0; i < array.length; i++) {
    if (!func(array[i])) {
      result = false;
      break;
    }
  }
  
  return result;
}

var isAString = function(value) {
  return typeof value === "string";
};

console.log(myOwnEvery(['a', 'a234', '1abc'], isAString));
