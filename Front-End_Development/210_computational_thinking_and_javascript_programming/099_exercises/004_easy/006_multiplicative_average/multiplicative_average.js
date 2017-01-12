// Multiplicative average

function showMultiplicativeAverage(array) {
  var total = array.reduce(function(acum, value) {
    return acum * value;
  }, 1);
  
  return total / array.length;
}

console.log(showMultiplicativeAverage([3, 5]));                 // 7.500
console.log(showMultiplicativeAverage([2, 5, 7, 11, 13, 17]));  // 28361.667