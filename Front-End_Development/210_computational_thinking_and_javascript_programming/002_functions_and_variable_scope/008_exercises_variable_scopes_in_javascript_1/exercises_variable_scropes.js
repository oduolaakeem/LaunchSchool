// Exercises Variable Scopes

// Exercise 1
// Please predict the output of the following programs and explain why.

var a = 'outer';

function testScope() {
  var a = 'inner';
  console.log(a);
}

console.log(a);
testScope();
console.log(a);

// Output to console will be:
// "outer"
// "inner"
// "outer"

// Exercise 2

var a = 'outer';

function testScope() {
  a = 'inner';
  console.log(a);
}

console.log(a);
testScope();
console.log(a);

// Output to console will be:
// "outer"
// "inner"
// "inner"
// As the variable is not declared locally, the assignment inside testScope is shadowing the
// outer a

// Exercise 3

var basket = 'empty';

function goShopping() {
  function shop1() {
    basket = 'tv';
  }

  console.log(basket);

  function shop2() {
    basket = 'computer';
  }

  function shop3() {
    var basket = 'play station';
    console.log(basket);
  }

  shop1();
  shop2();
  shop3();

  console.log(basket);
}

goShopping();

// Output to console will be:
// "empty"
// "play station"
// "computer"

// Exercise 4

console.log(a);

var a = 1;

// Output to console will be:
// "undefined"

// Exercise 5

console.log(a);

function hello() {
  a = 1;
}

// ReferenceError, a out of scope

// Exercise 6

function hello() {
  a = 'hello';
}

hello();
console.log(a);

// Output to console
// "hello"

// Exercise 7

function hello() {
  var a = 'hello'
}

hello();
console.log(a);

// Uncaught ReferenceError, variable a is not defined in the scope