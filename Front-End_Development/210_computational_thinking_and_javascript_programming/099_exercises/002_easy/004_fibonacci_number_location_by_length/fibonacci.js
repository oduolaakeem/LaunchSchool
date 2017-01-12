// Fibonacci

function findFibonacciIndexByLength(number) {
  var fib0 = 0;
  var fib1 = 1;
  var index = 1
  
  while (fib1.toFixed().length < number) {
    var temp = fib0;
    fib0 = fib1;
    fib1 = temp + fib1;
    index++;
  }
  
  return index;
}

console.log(findFibonacciIndexByLength(2));    // 7
console.log(findFibonacciIndexByLength(10));    // 45
console.log(findFibonacciIndexByLength(16));    // 74