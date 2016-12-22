// Iteration.js

var names = ['Eunice', 'Lucas', 'Mariana'];

names.forEach(function(name, index, array) {
  console.log(name, index, array[index]);
});

// Prints

// Eunice 0 Eunice
// Lucas 1 Lucas
// Mariana 2 Mariana

function myForEach(array, func) {
  for (var i = 0; i < array.length; i++) {
    func(array[i]);
  }
}

var min = Infinity;
var getMin = function(value) {
  min = value <= min ? value : min;
}

myForEach([4, 5, 12, 23, 3], getMin);
console.log(min);