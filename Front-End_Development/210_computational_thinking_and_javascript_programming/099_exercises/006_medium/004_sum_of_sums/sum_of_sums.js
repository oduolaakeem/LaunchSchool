// Sum of sums

function sumOfSums(array) {
  var result = [[array[0]]];
  
  for (var i = 2; i <= array.length; i++) {
    result.push(array.slice(0, i));
  }
  
  return result.reduce(function(acum, value) {
    return acum + value.reduce(function(total, num) {
      return total + num;
    })
  }, 0);
}

console.log(sumOfSums([3, 5, 2]));       // (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
console.log(sumOfSums([1, 5, 7, 3]));    // (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
console.log(sumOfSums([4]));             // 4
console.log(sumOfSums([1, 2, 3, 4, 5])); // 35