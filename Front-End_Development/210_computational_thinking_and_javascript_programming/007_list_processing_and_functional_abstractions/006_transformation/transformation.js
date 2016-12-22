// Transformation.js

var count = [1, 2, 3, 4, 5];
var doubled = count.map(function(number, index, array) {
  return number * 2;                        // double each number
});

console.log(doubled);                       // prints out [ 2, 4, 6, 8, 10 ]

// Build it to understand it

function myMap(array, func) {
  var newArray = [];
  
  for (var i = 0; i < array.length; i++) {
    newArray.push(plusOne(array[i]));
  }
  return newArray;
}

var plusOne = function(n) { return n + 1; };

var returnedArray = myMap([1, 2, 3, 4], plusOne);
console.log(returnedArray);