// Function declarations and function expressions

// Function declarations

function hello() {
  return 'hello world!';
}

console.log(typeof hello);    // function

function outer() {
  function hello() {
    return 'hello world!';
  }
  return hello();
}

console.log(typeof hello);  // can't access a local scope from here

var foo = outer;            // assign the function to another variable
foo();                      // we can then use it to invote the function

// Function Expressions

var hello = function() {
  return 'hello';
};

console.log(typeof hello);      // function
console.log(hello());           // hello

var foo = function() {
  return function() {           // function express as return value
    return 1;  
  }
};

var bar = foo();                // bar is assigned to the returned function

bar();                          // 1

// Named function expressions

var hello = function foo() {
  console.log(typeof foo);      // function
};

hello();

foo();                          // Uncaught ReferenceError: foo is not defined