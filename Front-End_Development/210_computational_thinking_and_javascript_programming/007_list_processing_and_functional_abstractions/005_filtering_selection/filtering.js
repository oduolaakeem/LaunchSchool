// Filtering.js

var count = [1, 2, 3, 4, 5];
var filtered = count.filter(function(number, index, array) {
  return number % 2 === 0;                    // look for the even numbers
});

console.log(filtered);                        // prints out [ 2, 4 ]

// Build it to understand it

function myFilter(array, func) {
  var newArray = [];
  
  for (var i = 0; i < array.length; i++) {
    if (func(array[i])) {
      newArray.push(array[i]);
    }
  }
  
  return newArray;
}

var isPythagoreanTriple = function(triple) {
  return Math.pow(triple.a, 2) + Math.pow(triple.b, 2) === Math.pow(triple.c, 2); 
};

var returnedArray = myFilter([{a: 3, b: 4, c: 5}, {a: 5, b: 12, c: 13},
          {a: 1, b: 2, c: 3}], isPythagoreanTriple);
console.log(returnedArray)