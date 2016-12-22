// Exercises Variable Scopes in JavaScript 2

// Exercise 1

function say() {
  if (false) {
    var a = 'hello from inside a block';
  }

  console.log(a);
}
say();

// Output to console will be:
// undefined

// Exercise 2

function hello() {
  a = 'hello';
  console.log(a);

  if (false) {
    var a = 'hello again';
  }
}

hello();
console.log(a);

// After hoisting we have...

function hello() {
  var a;
  a = 'hello';
  console.log(a);

  if (false) {
    a = 'hello again';
  }
}

hello();
console.log(a);

// Output to console will be:
// "hello"
// Uncaught ReferenceError: var a not defined

// Exercise 3

var a = 'hello';

for (var i = 0; i < 5; i++) {
  var a = i;
}

console.log(a);

// Output to the console will be:
// 4

// Exercise 4

var a = 1;

function foo() {
  a = 2;
  function bar() {
    a = 3;
    return 4;
  }

  return bar();
}

console.log(foo());
console.log(a);

// Output to console will be:
// 4
// 3

// Exercise 5

a = 'global'

function checkScope() {
  var a = 'local';
  function nested() {
    var a = 'nested';
    function supernested() {
      a = 'supernested';
      return a;
    }

    return supernested();
  }

  return nested();
}

console.log(checkScope());
console.log(a);

// Output to console:
// "supernested"
// "global"

// Exercise 6

var a = 'outer';
var b = 'outer';

console.log(a);
console.log(b);
setScope(a);
console.log(a);
console.log(b);

function setScope(foo) {
  foo = 'inner';
  b = 'inner';
}

// Output to the console
// "outer"
// "outer"
// "outer"
// "inner"

// Exercise 7

var total = 50;
var increment = 15;

function incrementBy(increment) {
  total += increment;
}

console.log(total);
incrementBy(10);
console.log(total);
console.log(increment);

// Output to the console will be:
// 50
// 60
// 15

// Exercise 8

var a = 'outer';

console.log(a);
setScope(a);
console.log(a);

var setScope = function() {
  a = 'inner';
}

// Output to the console
// "outer"
// Uncaught TypeError: setScope is not a function(...)

// Because of hoisting

// After hoisting we have

var a;
var setScope;

a = 'outer';

console.log(a);
setScope(a);
console.log(a);

setScope = function() {
  a = 'inner';
}