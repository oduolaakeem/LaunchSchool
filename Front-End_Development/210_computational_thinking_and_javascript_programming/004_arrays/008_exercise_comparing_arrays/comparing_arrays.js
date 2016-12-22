// Comparing Arrays

// Write a function, arraysEqual, that takes two Arrays as arguments.
// The function should return true if the Arrays contain the same values, and
// false if they do not.

// Test the arraysEqual function with Arrays that contain Numbers, Strings, and
// Boolean values. Don't worry about handling Arrays that contain other Arrays
// or Objects.

function arraysEqual(array1, array2) {
  var equal = true;
  if (array1.length !== array2.length) {
    equal = false;
  } else {
    for (var i = 0; i < array1.length; i++) {
      if (array1[i] !== array2[i]) {
        equal = false;
        break;
      }
    }
  }
  return equal;
}

console.log('Array equality...');
console.log(arraysEqual([1], [1]));
console.log(arraysEqual([1], [2]));
console.log(arraysEqual([1, 2], [1, 2, 3]));
console.log(arraysEqual([1, 'hi', true], [1, 'hi', true]));
console.log(arraysEqual([1, 'hi', true], [1, 'hi', false]));
console.log(arraysEqual([1, 'hi', true], [1, 'hello', true]));
console.log(arraysEqual([1, 'hi', true], [2, 'hi', true]));