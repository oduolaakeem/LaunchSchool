// Assessment

// Write a function that takes a two dimensional array as the argument, turn it 
// into a flat array and with all the duplicated elements removed. Treat numbers 
// and number strings, for example, 1 and '1' as duplicates, and keep the one 
// that appears first in the flattened array.

function flatTwoDimensionalArray(array) {
  var result = [];
  
  array.forEach(function(internalArray) {
    internalArray.forEach(function(value) {
      if (!valueIncluded(value, result)) {
        result.push(value);
      }
    });
  });
  
  return result;
}

function valueIncluded(value, array) {
  return (array.includes(value.toString()) || array.includes(Number(value)));
}

console.log(flatTwoDimensionalArray([[1, 2], [2, 4]]));
console.log(flatTwoDimensionalArray([[1, 2], ['2', 4]] ));
console.log(flatTwoDimensionalArray([[1, '2'], [2, 4]] ));
console.log(flatTwoDimensionalArray([[], []]));