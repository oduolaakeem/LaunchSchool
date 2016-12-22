// Array Operations

// Exercise 1
// Write a function, indexOf, that accepts two arguments: an Array and a value.
// The function should return the first index in the Array where the value is
// found, or -1 if the value is not found.

function indexOf(arr, value) {
  for (var i = 0; i < arr.length; i++) {
    if (arr[i] === value) {
      return i;
    }
  }
  return -1;
}

console.log('Ex1');
console.log(indexOf([1, 2, 3, 3], 3));
console.log(indexOf([1, 2, 3], 4));

// Exercise 2
// Write a function, lastIndexOf, that accepts two arguments: an Array and a value.
// The function should return the last index in the Array where the value
// is found, or -1 if the value is not found.

function lastIndexOf(arr, value) {
  for (var i = arr.length - 1; i >= 0; i--) {
    if (arr[i] === value) {
      return i
    }
  }
  return -1;
}

console.log(lastIndexOf([1, 2, 3, 3], 3));
console.log(lastIndexOf([1, 2, 3], 4));