// Defining functions

function triple(number) {
  console.log('tripling in process...');
  return number + number + number;
}

// call function with a value argument
console.log(triple(5));

// call function with a variable argument
var someNumber = 5;
console.log(triple(someNumber));

// call function and store the result in a variable
var result = triple(5);
console.log(result);

// If you are...	        Then you should use...
// Defining a function    parameters
// Invoking a function	  arguments

// When we define the function, a and b are called parameters.
function multiply(a, b) {
  // When this code runs, they are called arguments.
  return a * b;
}

