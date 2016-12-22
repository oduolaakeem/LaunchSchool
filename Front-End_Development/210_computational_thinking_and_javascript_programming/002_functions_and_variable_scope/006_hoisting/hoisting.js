// Hoisting

function hello() {
  var b = 'hello';
  return a;

  var a = 'world';
}

var a = 123;
var b = 456;

console.log(hello());        // what do you think this returns?

// the code above returns undefined

// The code above is equivalent to the following code

var a;          // hoisted to the top of the global scope
var b;

function hello() {
  var b;
  var a;        // hoisted to the top of the "hello" functional scope

  b = 'hello';

  return a;

  a = 'world';
}

a = 123;
b = 456;

hello();        // returns "undefined", not 123, since declaration of a is hoisted

// Hoisting for function declarations

console.log(hello());

function hello() {
  return 'hello world';
}

// Equivalent to...

function hello() {
  return 'hello world';
}

console.log(hello());      // logs "hello world"

// Hoisting for functions expressions

console.log(hello());

var hello = function() {
  return 'hello world';
}

// Equivalent to...

var hello;

console.log(hello());    // produces "Uncaught TypeError: hello is not a function"

hello = function() {
  return 'hello world';
}

// Best practices to avoid confusion

// Always declare variables on the top of their scopes.

function foo() {
  var a = 1;
  var b = 'hello';
  var c;

  ...
}

// Always declare functions before calling them

function foo() {
  return 'hello';
}

foo();