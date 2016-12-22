// Array Operations

// Exercise 1
// Write a function, push, that accepts two arguments: an Array and any other
// value. The function should add the second argument to the end of the Array
// and return the value.

function push(arr, value) {
  arr[arr.length] = value;
  return value;
}

console.log('Ex1');
var array = [1, 2, 3];
console.log(array);
console.log(push(array, 4));
console.log(array);

// Exercise 2
// Write a function, pop, that accepts one arguments: an Array. The function
// should remove the last element from the array and return it.

function pop(arr) {
  var value = arr[arr.length - 1];
  arr.length = arr.length - 1;
  return value;
}

console.log('Ex2');
var count = [1,2,3];
console.log(count);
console.log(pop(count));
console.log(count);

// Exercise 3
// Write a function, unshift, that accepts two arguments: an Array and a value.
// The function should add the value to the beginning of the Array and return
// the new length of the array. You'll need to use a for loop for this one.

function unshift(arry, value) {
  var arr = arry;
  for (var i = arr.length - 1; i >= 0; i--) {
    arr[i + 1] = arr[i];
  }
  arr[0] = value;
  return arr.length;
}

console.log('Ex3');
count = [1, 2, 3];
console.log(count);
console.log(unshift(count, 0));
console.log(count);

// Exercise 4
// Write a function, shift, that accepts one argument: an Array. The function
// should remove the first value from the beginning of the Array and return it.

function shift(arr) {
  var value = arr[0];
  for (var i = 1; i < arr.length; i++) {
    arr[i - 1] = arr[i];
  }
  arr.length = arr.length - 1;
  return value;
}

console.log('Ex5');
count = [1, 2, 3];
console.log(count);
console.log(shift(count));
console.log(count);