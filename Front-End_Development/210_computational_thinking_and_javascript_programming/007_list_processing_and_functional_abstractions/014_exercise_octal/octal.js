// Octal.js

function octalToDecimal(number) {
  var decimalArray;
  var result;
  
  decimalArray = number.split('').reverse().map(function(value, index){
    return (value * (Math.pow(8, index)));
  });
  
  result = decimalArray.reduce(function(total, value) {
    return total += value;
  });
  
  return result;
}

console.log(octalToDecimal('1'));
console.log(octalToDecimal('10'));
console.log(octalToDecimal('130'));
console.log(octalToDecimal('17'));
console.log(octalToDecimal('2047'));
console.log(octalToDecimal('011'));