// Great Common Divisor

function gcd(value1, value2) {
  if (value2 == 0) {
    return value1;
  } else {
    return gcd(value2, value1 % value2);
  }
}