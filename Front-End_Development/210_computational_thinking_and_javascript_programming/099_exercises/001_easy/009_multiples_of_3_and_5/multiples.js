// Multiples of 3 and 5

function multisum(number) {
  var sum = 0;
  
  for (var i = 1; i <= number; i++) {
    if (i % 5 === 0 || i % 3 === 0) {
      sum += i;
    }
  }
  
  return sum;
}

console.log(multisum(3));      // 3
console.log(multisum(5));      // 8
console.log(multisum(10));     // 33
console.log(multisum(1000));   // 234168