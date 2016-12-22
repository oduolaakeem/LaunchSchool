// Object properties

// Property names of objects can be any valid strings and property values
// can be any valid expressions:

var object = {
  a: 1,                           // a is a string with quotes omitted
  'foo': 2 + 1,                   // property name with quotes
  'two words': 'this works too',  // a two word string
  true: true,                     // property name is implicitly converted to string "true"
  b: {                            // object as property value
    name: 'Jane',
    gender: 'female',
  },
  c: function() {                 // function expression as property value
    return 2;
  },
};

// Property values can be accessed through the "dot notation" or the "bracket notation"

console.log(object.foo);
console.log(object['two words']);

// Adding and updating properties

var object = {};

object.a = 'foo';
object.a;

object['a name'] = 'hello';
object['a name'];

object;

// If the property name already exists, the assignment will update the property's value

// Deleting properties

var foo = {
  a: 'hello',
  b: 'world',
};

delete foo.a;
foo;            // {b: "world"}

