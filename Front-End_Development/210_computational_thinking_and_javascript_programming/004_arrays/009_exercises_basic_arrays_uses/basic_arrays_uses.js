// Basic arrays uses

// Exercise 1
// Write a function that will return the first element of an array that is
// passed to it as a parameter.

function firstElementOf(arr) {
  return arr[0];
}

console.log('Ex1');
console.log(firstElementOf(['U', 'S', 'A'])); // Returns "U"

// Exercise 2
// Write a function that will return the last element of an array that 
// is passed to it as a parameter.

function lastElementOf(arr) {
  return arr[arr.length - 1];
}

console.log('Ex2');
console.log(lastElementOf(['U', 'S', 'A'])); // Returns "A"

// Exercise 3
// Write a function that will accept two arguments, an array and an integer
// representing the position of the element to be returned by the function.
// What happens when we pass an index greater than the length of the array?
// What about a negative number?

function nthElementOf(arr, index) {
  return arr[index];
}

console.log('Ex3');

var digits = [4, 8, 15, 16, 23, 42];

console.log(nthElementOf(digits, 3)); // Returns 16
console.log(nthElementOf(digits, 8)); // What would this return?
console.log(nthElementOf(digits, -1)); // What would this return?

// Exercise 4

// You can add objects to the array at negative indexes

// Exercise 5

// Write a function that accepts an array as the first argument and a number
// as the second. Return a new array of elements that go from the first element
// and selects elements up to that count. Passing 3, for example, would return
// the first 3 elements of an array.

function firstNOf(array, length) {
  var newArray = [];
  for (var i = 0; i < length; i++) {
    newArray.push(array[i]);
  }
  return newArray;
}

console.log('Ex5');
digits = [4, 8, 15, 16, 23, 42];
console.log(firstNOf(digits, 3)); // Returns [4, 8, 15]

// Exercise 6

// Write a function like the previous one, except return the last n elements as
// a new array.

function lastNOf(array, length) {
  return array.slice(array.length - length);
}

console.log('Ex6');
digits = [4, 8, 15, 16, 23, 42];
console.log(lastNOf(digits, 3)); // Returns [16, 23, 42]
console.log(lastNOf(digits, 9));

// Exercise 7

// Using the function we have supplied you in the previous solution, what
// happens if you pass a count greater than the length of the array? How
// can you fix the behavior to return a new instance of the entire array
// if the count is greater than the array length?

function lastNOf(array, length) {
  if (length > array.length) {
    return array;
  } else {
    return array.slice(array.length - length);
  }
}

// Exercise 8

// Write a function that accepts two arrays as arguments and returns an
// array with the first element in the first array as well as the last
// element in the second array.

function endsOf(beginningArr, endingArr) {
  var newArray = [];
  newArray.push(beginningArr[0]);
  newArray.push(endingArr[endingArr.length - 1]);
  return newArray;
}

console.log('Ex8');
console.log(endsOf([4, 8, 15], [16, 23, 42])); // Returns [4, 42]