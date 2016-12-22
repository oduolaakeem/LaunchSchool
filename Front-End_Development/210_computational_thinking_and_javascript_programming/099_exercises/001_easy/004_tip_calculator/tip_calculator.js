// Tip Calculator

var bill = parseFloat(prompt('What is the bill? '));
var tipPercentage = parseFloat(prompt('What is the tip percentage? '));
var tip = parseFloat((bill * tipPercentage / 100).toFixed(2));

console.log('The tip is $' + tip);
console.log('The total is $' + (bill + tip).toFixed(2));