// Introduction to objects

'hi'.toUpperCase();     // 'HI'

// The line of code above is equivalent to the block below...

var a = 'hi';
typeof a;                       // "string", this is a primitive string value

var stringObject = new String(a);
typeof stringObject;            // "object", this is a String object

stringObject.toUpperCase();     // "HI"

// Creating custom objects

var colors = {
  red: '#f00',
  orange: '#ff0',
};

console.log(typeof colors);
console.log(colors.red);
console.log(colors.orange);

// Properties

var animal = 'turquoise';
animal.length; //9

colors.red; // "#f00"

var count = [0, 1, 2, 3, 4];
count.length = 2;

colors.blue = '#00f';
console.log(colors.blue);

// Methods

(5.234).toString();
'pizza'.match(/z/);
Match.ceil(8.675309);
Date.now();

// Trailing comma (,) at the end of each property and method definition.