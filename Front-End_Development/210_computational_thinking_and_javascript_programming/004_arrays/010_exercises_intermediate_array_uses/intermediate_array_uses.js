// Intermediate Array Uses

// Exercise 1

// Write a function that returns a new array of the elements in
// odd positions of an array parameter.

function oddElementsOf(arr) {
  var newArray = [];
  for (var i = 1; i < arr.length; i += 2) {
    newArray.push(arr[i]);
  }
  
  return newArray;
}

console.log('Ex1');

var digits = [4, 8, 15, 16, 23, 42];

console.log(oddElementsOf(digits)); // Returns [8, 16, 42]

// Exercise 2

// Write a function that accepts two arrays and returns a new array
// whose even positions are from the first array and odd positions
// are from the second array. Assume both arrays are equal length.

function combinedArray(even, odd) {
  var combined = [];
  for (var i = 0; i < even.length; i++) {
    combined.push(even[i]);
    combined.push(odd[i]);
  }
  return combined;
}

console.log('Ex2');

digits = [4, 8, 15, 16, 23, 42];
var letters = ['A', 'L', 'V', 'A', 'R', 'H'];

console.log(combinedArray(digits, letters));

// Exercise 3

// Write a function that returns a new array that contains a combination of
// the existing array elements as-is and the array elements in reverse order.

function mirroredArray(arr) {
  return arr.concat([].concat(arr).reverse());
}

console.log('Ex3');
var array1 = [1, 2, 3];
console.log(array1);
console.log(mirroredArray(array1));
console.log(array1);

// Exercise 4

// Write a function that accepts an array and a string. The function should
// return a string of the array elements joined together with the string
// used to join the elements together. An
// array ["a", "b", "c] and a string "+" should return "a+b+c". If no joining
// string is passed, use an empty string.

function joinArray(arr, joiner) {
  var joinString = ''
  if (joiner === undefined) {
    joiner = '';
  }
  
  for (var i = 0; i < arr.length; i++) {
    if (i > 0) {
      joinString += joiner;
    }
    
    joinString += arr[i];
  }
  
  return joinString;
}

console.log('Ex4')
console.log(joinArray(['a', 'b', 'c'], '+')); // Returns "a+b+c"
console.log(joinArray([1, 4, 1, 5, 9, 2, 7])); // Returns "1415927"

// Exercise 5

// Using the array sort method, create a function that accepts an array of
// numbers and returns a new array of the numbers sorted in descending order.

function sortDescending(arr) {
  var sortedArray = arr.slice();
  
  function compare(a, b) {
    return b - a;
  }
  
  return sortedArray.sort(compare);
}

console.log('Ex5');
console.log(sortDescending([23, 4, 16, 42, 8, 15])); // Returns [42, 23, 16, 15, 8, 4]

// Exercise 6

// Write a function that accepts an array of arrays and returns a new
// array containing the sums of each of the sub arrays.

function matrixSums(arr) {
  var sumArray = [];
  for (var i = 0; i < arr.length; i++) {
    var total = 0;
    for (var j = 0; j < arr[i].length; j++) {
      total += arr[i][j];
    }
    sumArray.push(total);
  }
  return sumArray;
}

console.log('Ex6');
console.log(matrixSums([[2, 8, 5], [12, 48, 0], [12]])); // Returns [15, 60, 12]

// Exercise 7

// Write a function that takes an array and returns a new array
// with duplicate elements removed.

function uniqueElements(arr) {
  var uniqueArray = [];
  for (var i = 0; i < arr.length; i++) {
    var timesFound = 0;
    for (var j = 0; j < uniqueArray.length; j++) {
      if (arr[i] === uniqueArray[j]) {
        timesFound++;
      }
    }
    
    if (timesFound < 1) {
      uniqueArray.push(arr[i]);
    }
  }
  
  return uniqueArray;
}

console.log('Ex7');
console.log(uniqueElements([1, 2, 4, 3, 4, 1, 5, 4])); // Returns [1, 2, 4, 3, 5]