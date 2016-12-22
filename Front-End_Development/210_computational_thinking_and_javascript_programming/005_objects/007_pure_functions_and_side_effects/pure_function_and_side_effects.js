// Pure functions and side effects

// When a Function doesn't cause any side effects when it is invoked, it is called
// a pure function. Another way to think about pure functions is to consider 
// that they only rely on their arguments to come up with whatever value they return.

// Example of a pure function

function add(a, b) {
  return a + b;
}

// Here is a function with side effects

var sum = 0;
function add(a, b) {
  sum = a + b;
}

// It you utilize a function for its return value, you typically want to have
// the function call as part of an expression, or assign it to a variabl.

function joinString(a, b, c) {
  return a.concat(b, c);
}

var result = joinString('hello,', ' ', 'world!');
console.log(result);

// When you write functions this way, avoid causing non-obvious side effects, because
// from the way the function is called at line 5, people generally don't
// expect this function to cause side effects, because the return value
// is captured and utilized.

// If you want to utilize a function for its side effect, when possible, pass the
// variable that it's going to mutate as one of the arguments:

var friends = ['Joe', 'Mary', 'David'];

function removeElement(array, element) {
  for (var i = 0; i < array.length; i++) {
    if (array[i] === element) {
      array.splice(i, 1);
    }
  }
}

removeElement(friends, 'David')     // undefined
friends;                            // ["Joe", "Mary"]

// You could also change your non-pure functions to pure functions to eliminate
// side effects:

var friends = ['Joe', 'Mary', 'David'];

function removeElement(array, element) {
  var newArray = [];

  for (var i = 0; i < array.length; i++) {
    if (array[i] !== element) {
      newArray.push(array[i]);
    }
  }

  return newArray;
}

removeElement(friends, 'David');    // ["Joe", "Mary"]
friends;                            // ["Joe", "Mary", "David"]