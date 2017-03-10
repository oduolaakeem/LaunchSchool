// script_4.js

// Write a function, startCounting, that causes a number to be printed to the screen 
// every second. Each number should be one larger than the number before it.

function startCounting(number) {
  return setInterval(function() {console.log(number++)}, 1000);
}

startCounting(0);