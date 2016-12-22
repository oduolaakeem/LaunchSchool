// Javascript coding styles

// Functions

// Never declare a function in a non-function block (if, while, etc).

// bad
if (currentUser) {
  function test() {
    console.log('Nope.');
  }
}

// good
var test;
if (currentUser) {
  test = function() {
    console.log('Yup.');
  };
}

// Never name a parameter arguments. This will take precedence over the arguments object
// that is  given to every function scope

// bad
function nope(name, options, arguments) {
  // ...stuff...
}

// good
function yup(name, options, args) {
  // ...stuff...
}