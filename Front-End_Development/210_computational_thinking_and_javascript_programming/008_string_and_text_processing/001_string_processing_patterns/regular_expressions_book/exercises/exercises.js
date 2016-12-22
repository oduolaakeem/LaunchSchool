function isUrl(string) {
  return !!string.match(/^https?:\/\/\S+$/);
}

console.log('Exercise 1');
console.log(isUrl('http://launchschool.com'));   // -> true
console.log(isUrl('https://example.com'));       // -> true
console.log(isUrl('https://example.com hello')); // -> false
console.log(isUrl('   https://example.com'));    // -> false

// Exercise 2

function fields(text) {
  return text.split(/[,\s]+/);
}

console.log('Exercise 2');

console.log(fields("Pete,201,Student"));
// -> ['Pete', '201', 'Student']

console.log(fields("Pete \t 201    ,  TA"));
// -> ['Pete', '201', 'TA']

console.log(fields("Pete \t 201"));
// -> ['Pete', '201'']


// Exercise 3

function mysteryMath(text) {
  return text.replace(/[+\-\/*]/, '?');
}

console.log('Exercise 3');

console.log(mysteryMath('4 + 3 - 5 = 2'));
// -> '4 ? 3 - 5 = 2'

console.log(mysteryMath('(4 * 3 + 2) / 7 - 1 = 1'));
// -> '(4 ? 3 + 2) / 7 - 1 = 1'

// Exercise 4

function mysteriousMath(text) {
  return text.replace(/[+\-*\/]/g, '?');
}

console.log('Exercise 4');

console.log(mysteriousMath('4 + 3 - 5 = 2'));           // -> '4 ? 3 ? 5 = 2'
console.log(mysteriousMath('(4 * 3 + 2) / 7 - 1 = 1')); // -> '(4 ? 3 ? 2) ? 7 ? 1 = 1'

// Exercise 5

function danish(text) {
  return text.replace(/\b(apple|blueberry|cherry)\b/, 'danish');
}

console.log('Exercise 5');

console.log(danish('An apple a day keeps the doctor away'));
// -> 'An danish a day keeps the doctor away'

console.log(danish('My favorite is blueberry pie'));
// -> 'My favorite is danish pie'

console.log(danish('The cherry of my eye'));
// -> 'The danish of my eye'

console.log(danish('apple. cherry. blueberry.'));
// -> 'danish. cherry. blueberry.'

console.log(danish('I love pineapple'));
// -> 'I love pineapple'