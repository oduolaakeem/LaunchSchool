// How big is the room

// Build a program that asks a user for the length and width of a room in meters and then logs to the console the area of the room in both square meters and square feet.

// Note: 1 square meter == 10.7639 square feet

// Do not worry about validating the input at this time. Use the prompt() function to collect user input.

var length = prompt('Enter the length of the room in meters: ');
var width = prompt('Enter the width of the room in meters: ');
var area = length * width;

console.log('The area of the room is ' + area.toFixed(2) + ' square meters (' + (area * 10.7639).toFixed(2) + ' square feet).');