// Exercises Functions

// Exercise 1
// We have a need for a piece of code that can be reused to return the average 
// of three numbers. Create a function statement named average that takes three 
// arguments, a, b, and c, and returns their average. Call the function by 
// passing in three numbers and log the result.

// function average(a, b, c) {
//   return sum(a, b, c) / 3;
// }

// console.log('Ex 1...');
// console.log(average(1, 2, 3));

// Exercise 2
// We now also need to calculate the sum of the same three data points. Create 
// a function statement named sum that takes the same three arguments and returns 
// the sum of the three arguments. Now modify the average function to call the sum
// function with those three arguments and use the return to calculate the average.

// function sum(a, b, c) {
//   return a + b + c;
// }

// console.log('Ex 2...');
// console.log(average(1, 2, 3));

// Exercise 3
// What if we have a different number of data points to create an average from? 
// As the function exists now, we'd have to write other functions to take different 
// numbers of arguments. Instead, we'll change the function to accept an array and 
// loop over the array elements to create a total before dividing by the length of 
// the array in order to calculate the average.

// At the start of the average function, create a variable named total and set it 
// to 0. With each iteration of the for loop, add the element to the total. Once 
// you're outside the for loop, return the total divided by the array's length. 
// Call average with an array of five numbers and log the result.

// function average(values) {
//   var total = 0;
//   for (var i = 0; i < values.length; i++) {
//     total += values[i];
//   }
//   return total / values.length;
// }

// console.log('Ex 3...');
// console.log(average([1, 2, 3]));

// Exercise 4
// It's probably a good idea to make the same changes to the sum function so we 
// can continue to use it from within the average function. Since we've already 
// written that functionality within the average function, we can move it from 
// there to the sum function. Copy the total variable declaration and for loop 
// to the sum function. Return the total. Replace the arguments with a single 
// values array argument.

// From within the average function, call the sum function and pass the array 
// that was sent to the average function. Call average with an array of five 
// numbers and log the result.

function sum(values) {
  var total = 0;
  for (var i = 0; i < values.length; i++) {
    total += values[i];
  }
  return total;
}

function average(values) {
  return sum(values) / values.length;
}

console.log('Ex 4...');
console.log(average([3, 3, 8, 3, 3]));

// Exercise 5
// Now that we have our functions refactored, we can use them to determine the 
// average of all of the numbers within an array. Create an array named temperatures 
// and add five temperature values to it. Find the average of them by passing the 
// array into it. Log the result.

var temperatures = [88, 96, 80, 85, 77];

console.log('Ex 5...');
console.log('Temperature average of previous five days... ' + average(temperatures) + 'F');