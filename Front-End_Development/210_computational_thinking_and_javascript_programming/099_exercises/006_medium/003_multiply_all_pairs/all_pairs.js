// All pairs

function multiplyAllPairs(array1, array2) {
  var result = [];
  
  for (var i = 0; i < array1.length; i++) {
    for (var j = 0; j < array2.length; j++) {
      result.push(array1[i] * array2[j]);
    }
  }
  
  return result.sort(function(a, b) {
    return a - b;
  })
}

console.log(multiplyAllPairs([2, 4], [4, 3, 1, 2])); // [2, 4, 4, 6, 8, 8, 12, 16]