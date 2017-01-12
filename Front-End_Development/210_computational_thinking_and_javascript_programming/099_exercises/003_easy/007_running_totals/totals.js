// Running Totals

function runningTotal(array) {
  var acum = 0;
  return array.map(function(value, index, arr) {
    if (index === 0) {
      acum = value;
    } else {
      acum += value;
    }
    return acum;
  });
}

console.log(runningTotal([2, 5, 13]));             // [2, 7, 20]
console.log(runningTotal([14, 11, 7, 15, 20]));    // [14, 25, 32, 47, 67]
console.log(runningTotal([3]));                    // [3]
console.log(runningTotal([]));                     // []