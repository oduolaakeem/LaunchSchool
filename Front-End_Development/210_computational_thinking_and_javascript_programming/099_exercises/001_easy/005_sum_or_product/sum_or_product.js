// Sum or Product

var upLimitNumber = parseInt(prompt('Please enter an integer greater than 0: '));
var operation = prompt('Enter \"s\" to compute the sum, \"p\" to compute the product: ');
var result;

if (operation === 's') {
  result = 0;
  for (var i = 0; i <= upLimitNumber; i += 1) {
    result += i;
  }
  console.log('The sum of the integers between 1 and ' + upLimitNumber + ' is ' + result);
} else if (operation === 'p') {
  result = 1;
  for (var i = 1; i <= upLimitNumber; i += 1) {
    result *= i;
  }
  console.log('The product of the integers between 1 and ' + upLimitNumber + ' is ' + result);
} else {
  console.log('Error!!')
}