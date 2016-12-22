// Arrays and Objects

// Arrays are objects...

var a = ['hello', 'world'];

console.log(typeof a);            // "object"
console.log(a['1']);              // "world", object's bracket notation to access value
console.log(Object.keys(a));      // ["0", "1"], the keys of the object!

// line 5 is equivalent of:

var a = {
  '0': 'hello',
  '1': 'world',
}

// When in need of deleting a value from an array, is better to use the splice
// array function than delete