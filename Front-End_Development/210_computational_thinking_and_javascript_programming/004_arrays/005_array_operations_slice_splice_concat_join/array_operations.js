// Previous functions

function push(arr, value) {
  arr[arr.length] = value;
  return value;
}

function pop(arr) {
  var value = arr[arr.length - 1];
  arr.length = arr.length - 1;
  return value;
}

function unshift(arry, value) {
  var arr = arry;
  for (var i = arr.length - 1; i >= 0; i--) {
    arr[i + 1] = arr[i];
  }
  arr[0] = value;
  return arr.length;
}

function shift(arr) {
  var value = arr[0];
  for (var i = 1; i < arr.length; i++) {
    arr[i - 1] = arr[i];
  }
  arr.length = arr.length - 1;
  return value;
}

// Array operations

// Exercise 1
// Write a function, slice, that accepts three arguments: an Array, a start
// index, and an end index. The function should return a new Array that contains
// values from the original Array, starting at the the first index and up to but
// not including the second index. The original Array should not be modified.

function slice(arr, start, end) {
  var newArray = []
  for (var i = start; i < end; i++) {
    push(newArray, arr[i]);
  }
  return newArray;
}

console.log('Ex1');
var array = [1,2,3,4,5];
console.log(array);
console.log(slice(array, 0, 2));
console.log(array);
console.log(slice(['a', 'b', 'c', 'd', 'e', 'f', 'g'], 1, 3));

// Exercise 2
// Write a function, splice, that accepts three arguments: an Array, a start
// index, and a number of values to remove. The function should remove values
// from the original Array, starting at the the first index and removing the
// specified number. The method should return the removed values in a new Array.

function splice(arr, start, numToRemove) {
  var newArray = [];
  for (var i = start; i < arr.length; i++) {
    if (i < start + numToRemove) {
      push(newArray, arr[i]);  
    }
    arr[i] = arr[i + numToRemove];
  }
  arr.length = arr.length - numToRemove;
  return newArray;
}

console.log('Ex2');
var count = [1, 2, 3, 4, 5, 6, 7, 8];
console.log(count);
console.log(splice(count, 2, 5));
console.log(count);

// Exercise 3
// Write a function, concat, that accepts two arguments: both Arrays. The function
// should return a new Array containing the values from each of the passed Arrays.

function concat(arr1, arr2) {
  var newArray = [];
  for (var i = 0; i < arr1.length; i++) {
    push(newArray, arr1[i]);
  }
  for (var i = 0; i < arr2.length; i++) {
    push(newArray, arr2[i]);
  }
  return newArray;
}

console.log('Ex3');
var array1 = [1, 2, 3];
var array2 = [4, 5, 6];
console.log(array1);
console.log(array2);
console.log(concat(array1, array2));
console.log(array1);
console.log(array2);

// Exercise 4
// Write a function, join, that accepts two arguments: an Array and a String.
// The function should convert each value in the Array into a String, and
// join those values together using the second argument as a separator.

function join(arr, delimiter) {
  var joinString = '';
  for (var i = 0; i < arr.length - 1; i++) {
    joinString += arr[i].toString() + delimiter;
  }
  joinString += arr[arr.length - 1].toString();
  return joinString;
}

console.log('Ex4');
console.log(join(['bri', 'tru', 'wha'], 'ck '));
console.log(join([1, 2, 3], ' and '));