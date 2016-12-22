// Good
var book = 'Head-First JavaScript Programming';

// Bad
var Book = 'Head-First JavaScript Programming';

// number, string, array, object
var myNumber = 26;
var myString = 'Double 13';
var myArray = [13, 13];
var myObject = {
  count: 26,
};

// functions
var addValues = function(a, b) {
  return a + b;
};

// same conventions for object properties
var myObject = {
  myNumber: 26,
  myMethod: function() { },
};

// formatting

// always use two space characters for indentation. never use tab characters.
if (myObject.hasOwnProperty('foo')) {
  console.log('Foo is defined');
} else {
  console.log('Foo is undefined');
}

var i;

// Bad
i=0;
while(i<15){
  i+=1;
}

// Good
i = 0;
while (i < 15) {
  i += 1;
}

// Declarating variables

// Bad
var firstName = 'Shane',
    lastName = 'Riley',
    dogs = ['Josie', 'Libby'];
    
// Good
var firstName = 'Shane';
var lastName = 'Riley';
var dogs = ['Josie', 'Libby'];