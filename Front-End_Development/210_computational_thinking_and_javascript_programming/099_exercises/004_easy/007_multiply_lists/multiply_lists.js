// Multiply Lists

function multiplyList(array1, array2) {
  return [].concat(array1).map(function(value, index) {
    return value * array2[index];
  });
}

console.log(multiplyList([3, 5, 7], [9, 10, 11])); // [27, 50, 77]