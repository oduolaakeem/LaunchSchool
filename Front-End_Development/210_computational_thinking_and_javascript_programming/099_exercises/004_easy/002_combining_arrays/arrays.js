// Combining Arrays

function union(array1, array2) {
  var result = []
  
  array1.forEach(function(elem) {
    if (!result.includes(elem)) {
      result.push(elem);
    }
  });
  
  array2.forEach(function(elem) {
    if (!result.includes(elem)) {
      result.push(elem);
    }
  });
  
  return result;
}

function union2() {
  console.log(arguments);
}

console.log(union([1, 3, 5], [3, 6, 9])); // [1, 3, 5, 6, 9]
union2([1, 3, 5], [3, 6, 9]);