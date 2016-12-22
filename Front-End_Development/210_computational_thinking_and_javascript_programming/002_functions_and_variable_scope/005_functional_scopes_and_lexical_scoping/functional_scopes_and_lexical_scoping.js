// Functional scope and lexical scoping

// Global scope

var name = 'Julian';
console.log(name);

for (var i = 0; i < 3; i++) {
  console.log(name);
}

console.log(name);

// Function scope

var name = 'Julian';

function greet() {
  console.log(name);
}

greet();    // prints "Julian"

  // No matter how deep it is inside inner scopes

var name = 'Julian';

function greet() {
  function say() {
    console.log(name);
  }
  
  say();
}

greet()   // still prints "Julian"

// Clousures

var count = 1;

function printCount() {
  console.log(count);
}

printCount();
// logs out: 1


count++;

printCount();
// logs out: 2

// Lexical scoping

// Adding variables to the current scope

function lunch() {      // A function declaration creates a new variable scope
  var food = 'taco';    // 1. Add a new variable food within the current variable scope
}

function eat(food) {    // 2. Parameters create variables during Function invocation.
  console.log('I am eating' + food);
}

// Variable assignment

var country = 'Spain';
function update() {
  country = 'Liechtenstein';
}

console.log(country);

// logs out:
// Spain

update();
console.log(country);

// logs out:
// Liechtenstein

// Variable shadowing

var name = 'Julian';

function greet() {
  var name = 'Logan';
  console.log(name);
}

var name = 'Julian';

function greet(name) {
  console.log(name);
}

greet('Sam');

// Logs:
// Sam

