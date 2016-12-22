// Conditionals

var score = 80;

if (score > 70) {
  console.log('Congratulations, you passed!');
} else {
  console.log('Sorry, but you need to study more!');
}

// if...else if...else blocks

// if (condition1) {
//   // statements
// } else if (condition2) {
//   // statements
// } else if (conditionN) {
//   // statements
// } else {
//   // statements
// }

// Truthy and falsy

// if (false)        // falsy
// if (null)         // falsy
// if (undefined)    // falsy
// if (0)            // falsy
// if (NaN)          // falsy
// if ('')           // falsy

// if (true)     // truthy
// if (1)        // truthy
// if ('abc')    // truthy
// if ([])       // truthy
// if ({})       // truthy

// Example

// With the logical operator the return values are such:
1 || 2;        // 1
1 && 2;        // 2

// Using the logical operator as a `condition` in an if statement
if (1 || 2) {}   // truthy
if (1 && 2) {}   // truthy

// Switch

var reaction = 'negative';

switch (reaction) {
  case 'positive':
    console.log('The sentiment of the market is positive');
    break;
  case 'negative':
    console.log('The sentiment of the market is negative');
    break;
  case 'undecided':
    console.log('The sentiment of the market is undecided');
    break;
  default:
    console.log('The market has not reacted enough');
}

// console output
// The sentiment of the market is negative
// The sentiment of the market is undecided
// The market has not reacted enough