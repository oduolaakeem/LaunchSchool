// script_5.js

// Extend the code from the last exercise by adding a stopCounting function that, when called, stops 
// the increasing numbers from being printed to the screen.

function startCounting(number) {
  return setInterval(function() {console.log(number++)}, 1000);
}

function stopCounting(id) {
  clearInterval(id);
}

var counterId = startCounting(0);

