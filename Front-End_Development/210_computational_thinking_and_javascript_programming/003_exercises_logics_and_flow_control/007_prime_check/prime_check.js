// Prime Check

function isPrime(number) {
  var divisors = 0;
  
  for (var i = 0; i <= number; i++) {
    if ((divisors >= 2 && i < number) || number <= 1) {
      return false;
    }
    
    if (number % i == 0) {
      divisors++;
    }
  }
  return true;
}