
// var alive = true;
// var ideas = [];
// var newIdea;

// function reviewIdea(idea) {}
// // Creativity process


// while (alive) {
//   ideas.push(newIdea);
//   for (var i = 0; i < ideas.length; i++) {
//     reviewIdea(ideas[i]);
//   }
// }

// Working with the function argument object

function printArgs() {
  console.log(arguments[0]);
  console.log(arguments[1]);
  console.log(arguments.length);

  var args = Array.prototype.slice.call(arguments);  
  console.log(typeof arguments);
  console.log(Array.isArray(arguments));
  // var a = arguments.pop();
  
  console.log(typeof args);
  console.log(Array.isArray(args));
  var a = args.pop();
}

printArgs(1, 2);

// Function that accepts any number of arguments

function sum2(a, b) {
  return a + b;
}

function sum3(a, b, c) {
  return a + b + c;
}

function sum() {
  var result = 0;
  for (var i = 0; i < arguments.length; i++) {
    result += arguments[i];
  }
  return result;
}

console.log(sum());                // 0
console.log(sum(1, 2, 3));         // 6
console.log(sum(1, 2, 3, 4, 5));   // 15