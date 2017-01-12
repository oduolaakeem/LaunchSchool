// Sum of digits

function sum(number) {
  return number.toString().split('').map(function(stringNumber) {
    return parseInt(stringNumber);
  }).reduce(function(acum, value) {
    return acum + value;
  });
}

console.log(sum(23));          // 5
console.log(sum(496));         // 19
console.log(sum(123456789));   // 45
console.log(sum(12345677854));