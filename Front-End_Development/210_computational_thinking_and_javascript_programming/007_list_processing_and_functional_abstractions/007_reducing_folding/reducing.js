// Reducing.js

function add(previousValue, element, array) {
  return previousValue + element;
}

var count = [1, 2, 3, 4, 5];
count.reduce(add);            // 15

// Build it to understand it

function myReduce(array, func, initial) {
  var value, index;
  
  if (initial) {
    value = initial;
    index = 0;
  } else {
    value = array[0];
    index = 1;
  }
  
  array.slice(index).forEach(function(element) {
    value = func(value, element);
  });
  
  return value;
}

var smallest = function(result, value) {
  return result <= value ? result : value;
};

console.log(myReduce([5, 12, 15, 1, 6], smallest));