// Working with dates

// Exercise 1

// Create a variable named today and create a new date for its value.

var today = new Date;

console.log('Ex1');
console.log(today);

// Exercise 2 and 3

// Log a friendly string that tells the current day of the week. Using the getDay
// method on the date, log a string that outputs "Today's day is " plus the day.

console.log('Ex2');
var days = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday']
console.log('Today\'s day is ' + days[today.getDay()]);

// Exercise 4 and 5

// Expanding on our nicely formatted string, we want to display the calendar date
// at the end of it so we get a log like "Today's date is Mon, the 6th". Use
// the getDate method to output the current date.

function ordinal(number) {
  var first = [1, 21, 31];
  var second = [2, 22];
  var third = [3, 23];
  var ord = '';
  if (first.indexOf(number) !== -1) {
    ord =  'st'; 
  } else if (second.indexOf(number) !== -1) {
    ord = 'nd';
  } else if (third.indexOf(number) !== -1) {
    ord = 'rd'
  } else {
    ord = 'th'
  }
  return number.toString() + ord;
}

console.log('Ex 4 and 5');
console.log('Today\'s day is ' + days[today.getDay()] + ' the ' + ordinal(today.getDate()));

// Exercise 6 and 7

// Change your string output to include the value from getMonth so the string will
// read "Today's date is Mon, " + today.getMonth() + " 6th".

var months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];

console.log('Ex 6 and 7');
console.log('Today\'s day is ' + days[today.getDay()] + ', ' + months[today.getMonth()] + ' the ' + ordinal(today.getDate()));

// Exercise 8

// Our log call is quite cluttered at this point, and it would probably be useful
// later on to have the formatters as functions that could be called anywhere in
// our code. Create formattedMonth and formattedDay functions to format the month
// and day, then create a formattedDate function that pulls everything together
// and logs the full formatted date.

function formattedDay(date) {
  var days = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];
  return days[date.getDay()];
}

function formattedMonth(date) {
  var months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
  return months[date.getMonth()];
}

function formattedDate(date) {
  return 'Today\'s day is ' + formattedDay(date) + ', ' + formattedMonth(date) + ' the ' + ordinal(date.getDate()) + ', T' + formatTime(date);
}

console.log('Ex8');
console.log(formattedDate(today));

// Exercise 9

// Log the value returned from the getYear method. The value returned is
// actually the number of years since 1900. Create a function that will format
// the year by adding 1900 to it.

console.log('Ex9');
console.log(today.getYear());

function getYear(date) {
  return 1900 + date.getYear();
}

console.log(getYear(today));

// Exercise 10

// The date object actually has a function for this already. Remove your
// formatted year function and instead use getFullYear.

console.log('Ex10');
console.log(today.getFullYear());

// Exercise 11

// Using the getTime method log the date and time in total milliseconds since Jan. 1st 1970

console.log('Ex11');
console.log(today.getTime());

// Exercise 12

// Create a new variable named tomorrow. Set it to a new date equal to the today
// date by passing today in to the date constructor. Change the date on the
// tomorrow date object to the next day by calling setDate and passing it the
// value for the next date. Pass the tomorrow object into your formattedDate
// function to log the date.

console.log('Ex12');
var tomorrow = new Date(today);
tomorrow.setDate(today.getDate() + 1);
console.log(formattedDate(tomorrow));

// Exercise 13

// Create a new variable named nextWeek that is a new date based on the today
// object. Log a comparison of the nextWeek and today objects to see if they
// are equal.

console.log('Ex13');
var nextWeek = new Date(today);
console.log(today === nextWeek);

// Exercise 14

// Since these are pointing to two different objects, we need to compare the
// values they hold to know if they are equal. Compare the values returned by
// calling toDateString to see if they are equal. Then add 7 days to the
// nextWeek date and compare them.

console.log('Ex14');
console.log(today.toDateString() === nextWeek.toDateString());
nextWeek.setDate(today.getDate() + 7);
console.log(today.toDateString() === nextWeek.toDateString());

// Exercise 15

// Finally, we'll use getHours to obtain the date's hour. Create another function
// called formatTime that will return a string formatted with the hours and minutes
// as "15:30". Make sure you handle the situation that you need to pad a leading
// zero to a single digit number, for example, "03:04".

console.log('Ex15');

function formatTime(date) {
  var hours = date.getHours();
  var minutes = date.getMinutes();
  var stringHours = hours.toString();
  var stringMinutes = minutes.toString();
  
  if (stringHours.length === 1) {
    stringHours = '0' + stringHours;
  }
  
  if (stringMinutes.length === 1) {
    stringMinutes = '0' + stringMinutes;
  }
  
  return stringHours + ':' + stringMinutes;
}

console.log(formattedDate(today));