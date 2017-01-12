// Counting Up

function sequence(number) {
  var array = [];
  
  for (var i = 1; i <= number; i++) {
    array.push(i);
  }
  
  return array;
}

console.log(sequence(5)); // [1, 2, 3, 4, 5]
console.log(sequence(3)); // [1, 2, 3]
console.log(sequence(1)); // [1]console.log());