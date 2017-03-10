// script_3.js

// Write a Function, afterNSeconds, that takes two arguments: a callback and a 
// number of seconds to wait. The callback should be run after the specified number of seconds.

function afterNSeconds(callback, seconds) {
  setTimeout(callback, seconds * 1000);
}

afterNSeconds(function() {
  console.log('this will appear after three seconds.');
}, 3);