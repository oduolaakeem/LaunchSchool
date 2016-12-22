// Find Missing Numbers

// Write a function that takes a sorted array of integers as an argument, and
// returns an array that includes all of the missing integers (in order)
// between the first and last elements of the argument.

function missing(arr) {
  var missingValues = [];
  var currentValue = arr[0];
  var index = 0;
  
  while (currentValue !== arr[arr.length - 1]) {
    index++;
    currentValue++;
    while (currentValue !== arr[index]) {
      missingValues.push(currentValue);
      currentValue++;
    }
  }
  
  return missingValues;
}

console.log(missing([-3, -2, 1, 5]));                  // [-1, 0, 2, 3, 4]
console.log(missing([1, 2, 3, 4]));                    // []
console.log(missing([1, 5]));                          // [2, 3, 4]
console.log(missing([6]));                             // []