// Javascript coding styles

// Numbers

// Use Number for type casting and parseInt always with a radix for parsing strings

var inputValue = '4';

// bad
var val = new Number(inputValue);

// bad
var val = +inputValue;

// bad
var val = parseInt(inputValue);

// good
var val = Number(inputValue);

// good
var val = parseInt(inputValue, 10);