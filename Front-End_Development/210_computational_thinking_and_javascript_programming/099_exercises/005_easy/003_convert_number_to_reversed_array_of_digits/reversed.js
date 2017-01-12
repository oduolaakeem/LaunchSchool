// Reversed array of digits

function reversedNumber(number) {
  return parseInt(number.toString().split('').reverse().join(''));
}

console.log(reversedNumber(12345)); // 54321
console.log(reversedNumber(12213)); // 31221
console.log(reversedNumber(456));   // 654
console.log(reversedNumber(12000)); // 21 # Note that zeros get dropped!
console.log(reversedNumber(1));     // 1