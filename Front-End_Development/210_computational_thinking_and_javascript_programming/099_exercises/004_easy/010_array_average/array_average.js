// Array Average

function average(array) {
  var total = array.reduce(function(acum, value) {
    return acum + value
  }, 0);
  
  return Math.floor(total / array.length);
}

console.log(average([1, 5, 87, 45, 8, 8]));    // 25
console.log(average([9, 47, 23, 95, 16, 52])); // 40