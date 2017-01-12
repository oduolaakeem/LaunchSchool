// Double Doubles

function twice(number) {
  if (!isDouble(number)) {
    return number * 2;
  } else {
    return number;
  }
}

function isDouble(number) {
  var stringNumber = number.toFixed();
  var stringLenght = stringNumber.length
  if (stringLenght % 2 === 0) {
    var firstHalf = stringNumber.substring(0, stringLenght / 2);
    var secondHalf = stringNumber.substring(stringLenght / 2);
    
    if (firstHalf === secondHalf) {
      return true;
    }
  }
  return false;
}

console.log(twice(37));                 // 74
console.log(twice(44));                 // 44
console.log(twice(334433));             // 668866
console.log(twice(444));                // 888
console.log(twice(107));                // 214
console.log(twice(103103));             // 103103
console.log(twice(3333));               // 3333
console.log(twice(7676));               // 7676console.log()