// Exercises operaots and conditionals

// Exercise 1
// Set a variable, apples, to 3. Set a second variable, bananas, to 5. Write a conditional using == that checks
// wheter apples is equal to bananas. log a message if true.

var apples = 3;
var bananas = 5;

if (apples == bananas) {
  console.log('Ex1...There is equal number of apples and bananas.');
}

// Exercise 2
// Set the value of bananas to a string of the number "3". Use the same conditional as the previous problem.

bananas = "3";

if (apples == bananas) {
  console.log('Ex2...There is equal number of apples and bananas.');
}

// Exercise 3
// Change the conditional from the previous problem to use === instead. why doesn't this one output
// the message?

if (apples === bananas) {
  console.log('Ex3...There is equal number of apples and bananas.');
}

// Exercise 4
// Create an else statement that logs a different message if false

if (apples === bananas) {
  console.log('Ex4...There is equal number of apples and bananas.');
} else {
  console.log('Ex4...Not Equal!!');
}

// Exercise 5
// Create an else if statment that checks if apples == bananas in between the if and else statements.
// Log a message stating the two are the same number but different types.

if (apples === bananas) {
  console.log('Ex5...There is equal number of apples and bananas.');
} else if (apples == bananas) {
  console.log('Ex5...Equal number but different type.');
} else {
  console.log('Ex5...Not Equal!!');
}

// Exercise 6
// Move the else if statement into the else statement and change to an if statement. after your
// if statement, add an else statement that outputs your "not strict equal" message as before.
// The structure of the code should look like:

if (apples === bananas) {
  console.log('Ex6...There is equal number of apples and bananas.');
} else {
  if (apples == bananas) {
    console.log('Ex6...Equal number but different type.');
  } else {
    console.log('Ex6...Not strict equal');
  }
}

// Exercise 7
// Set variables apples and bananas to 3. Set a variable, areEqual, to the value of apples compared to bananas. This works the
// same way as the if statement we have been writing, but rather than an if and the condition parentheses,we just use the
// comparison that occurs within the parentheses to set out variable. Log the value of areEqual.

apples = 3;
bananas = 3;

var areEqual = (apples === bananas);

console.log('Ex7...');
console.log(areEqual);

// Exercise 8
// Set apples to 3 and bananas to undefined. Set a variable, eitherOr, to the value of apples or bananas. This works the same
// as the previous exercise, where you write the comparison as the assignment of the variable. Log the value of eitherOr

apples = 3;
bananas = undefined;

var eitherOr = (apples || bananas);

console.log('Ex8...');
console.log(eitherOr);

// Exercise 9
// Set the value of bananas to 1. Perform the same assignment for eitherOr. Afterwards, reassign eitherOr
// to the same result of bananas || apples. Note that the value is now the bananas variable rather
// thank apples. JavaScript reads this statment from left to right. If the left side has a value, it
// is used. Otherwise it checks the next value.

bananas = 1;

console.log('Ex9...');
eitherOr = (apples || bananas);
console.log(eitherOr);
eitherOr = (bananas || apples);
console.log(eitherOr);

// Exercise 10
// Another useful method of defining a variable to one of two possible values is called the ternary operator.
// This can also take the place of an if and else statement, but can often end up being confusing when used for that 
// purpose.

// Create two new variables, lastName and familyMessage. Set the lastName to your last name, then assign familyMessage
// to either "You're part of the family!" or "You're not family." using a ternary that checks to see if
// lastName is equal to your last name.

console.log('Ex10...');

var lastName;
var familyMessage;

lastName = "Perez";

(lastName === "Ochoa") ? familyMessage = "You're part of the family!" : familyMessage = "You're not family.";

console.log(familyMessage);