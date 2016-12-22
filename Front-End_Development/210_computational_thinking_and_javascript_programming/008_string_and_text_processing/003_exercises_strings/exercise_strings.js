// Exercise Strings

// Exercise 1

var firstName = 'Lucas';
var lastName = 'Ochoa';

var fullName = firstName + ' ' + lastName;

console.log(fullName);

// Exercise 2

console.log(firstName.concat(lastName));
console.log(firstName);

// Exercise 3

console.log(fullName.split(' '));

// Exercise 4

var language = 'JavaScript';
var idx = language.indexOf('S');

console.log(idx);

// Exercise 5

var charCode = language.charCodeAt(idx);

console.log(charCode);

// Exercise 6

console.log(String.fromCharCode(charCode));

// Exercise 7

console.log(language.lastIndexOf('a'));

// Exercise 8

var a = 'a';
var b = 'b';

console.log(a > b);

b = 'B';

console.log(a > b);

// Exercise 9

var aIndex = language.indexOf('a');
var vIndex = language.indexOf('v');

console.log(language.substr(aIndex, 4));
console.log(language.substr(vIndex, 4));

// Exercise 10

console.log(language.substring(aIndex, 4));
console.log(language.substring(vIndex, 4));

// Exercise 11

var fact1 = 'JavaScript is fun';
var fact2 = 'Kids like it too';

var compoundSentence = fact1 + ' and ' + fact2.toLowerCase();

console.log(compoundSentence);

// Exercise 12

console.log(fact1[0]);
console.log(fact2[0]);

// Exercise 13

var pi = 22/7;
pi = pi.toString();

console.log(pi.lastIndexOf('14'));

// Exercise 14

var boxNumber = 356..toString();

console.log(boxNumber);

boxNumber = (356).toString();

console.log(boxNumber);

// Exercise 15

console.log(typeof boxNumber);

boxNumber = parseInt(boxNumber);

console.log(typeof boxNumber);

boxNumber = boxNumber + '';

console.log(typeof boxNumber);

// Exercise 16

var name = prompt('What is your name? ');
    
if (name.endsWith('!')) {
    console.log('HELLO ' + name.substring(0, name.length - 1).toUpperCase() + '. WHY ARE YOU SCREAMING?');
} else {
    console.log('Hello ' + name);
}
