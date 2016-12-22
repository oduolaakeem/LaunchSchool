// Working with the math object

// Exercise 1

// All of the Math methods expect and return values in radians rather than
// degrees. Mathematically, radians are easier to work with in the confines
// of a programming language, so nearly all languages will use radians for
// circle and arc calculations. To read more about radians, check out this
// article. Using the Math.PI property, create a function that will convert
// radians to degrees.

function radiansToDegrees(rad) {
  return (rad * 180 / Math.PI);
}

// Exercise 2

// Converting a positive integer to a negative is as simple as placing a minus
// sign in front of the variable, but if you don't know whether or not the
// original value is negative you may inadvertently convert your variable
// to the wrong value. Using Math.abs, you can ensure that you are converting
// your value to a positive or negative value. Create a variable with a value
// of -180. Using the abs function on Math, log the positive value of the variable.

console.log('Ex2');

var number = -180;
console.log(Math.abs(number));

// Exercise 3

// Calculating the square of a number can be achieved by multiplying the number
// by itself. Obtaining the square root of a number takes more work. Rather
// than write a function to calculate this yourself, use the Math.sqrt function
// to find the square root of 16777216.

console.log('Ex3');
console.log(Math.sqrt(16777216));

// Exercise 4

// Creating the square of a variable is a simple matter of multiplying it by
// itself, but how about calculating a variable to the power of 7? Instead of
// writing your own function, Math.pow takes two arguments, the base and the
// exponent, and returns the result. Use Math.pow to log the result of 16
// to the 6th power.

console.log('Ex4');
console.log(Math.pow(16, 6));

// Exercise 5

// While rounding numbers up or down in JavaScript, there are three methods to
// assist you. Math.round will take any decimal value greater or equal to .5 and
// round it up to the nearest integer. Math.floor will take any number and reduce
// it to the next lower integer, effectively cropping any decimal place. Math.ceil
// will take any number and increase it to the next highest integer, meaning that
// if there is any decimal value present the return is one more than the integer
// value of the number.

console.log('Ex5');

var a = 50.72;
var b = 49.2;
var c = 49.86;

console.log(Math.floor(a));
console.log(Math.ceil(b));
console.log(Math.round(c));

// Exercise 6

// ath.random is a method that will return a random floating-point number
// between 0 and 1. This isn't too helpful on its own, since most of the time
// you want a random number it's between two integer values and you would like
// an integer returned. Create a function that takes two arguments, a minimum and
// a maximum value, and returns a random integer from min through max using
// Math.random.

console.log('Ex6');

function random(min, max) {
  return Math.round((Math.random() * (max - min)) + min);
}

