// Exercises primitive types and coercions

// Exercise 1
// The result of this calculation is currently a string. Using type coercion, correct the calculation to get
// the correct result.

var x = '13';
var y = 9;

console.log(Number(x) + y); // or console.log(+x + y)

// Exercise 2
// Using the same block of javascript, change the addition operator to a multiplication operator and leave
// x as string. will the result be a string or a number?

console.log(x * y);   // answer, the result will be a number

// Exercise 3
// Convert the three part of this telephone number to string in order to obtain a correct concatenated ophone
// number.

var npa = 212;
var nxx = 555;
var num = 1212;

console.log(npa.toString() + nxx.toString() + num.toString());

// Exercise 4
// Strings can also be created from numbers usint the String() constructor. This function takes an 
// argument and converts it to a string. Try it out using the previous block of code, wrapping each
// number in a String() call.

console.log(String(npa) + String(nxx) + String(num));

// Exercise 5
// Another way of converting values to string is to call the toString method on them. Try converting
// a boolean and an array using toString. Did you receive the string you expected?

var bool = true;
var arr = [1, 2, 3];

console.log(bool.toString());
console.log(arr.toString());

// R/ yes, the values get converted as expected.