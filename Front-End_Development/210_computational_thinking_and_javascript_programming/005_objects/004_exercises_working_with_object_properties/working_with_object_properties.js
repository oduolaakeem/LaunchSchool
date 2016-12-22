// Exercises: Working with object properties

// Exercise 1

// Write a function, objectHasProperty, that takes two arguments: an Object and 
// a String. If the Object contains a property with the specified name, the
// function should return true. Otherwise, it should return false.

var pets = {
  cat: 'Simon',
  dog: 'Dwarf',
  mice: null,
  method: function() {console.log('do nothing');},
};

function objectHasProperty(obj, string) {
  if (Object.keys(obj).indexOf(string) !== -1) {
    return true;
  }
  return false;
}

console.log('Ex1');
console.log(objectHasProperty(pets, 'dog'));       // true
console.log(objectHasProperty(pets, 'lizard'));    // false
console.log(objectHasProperty(pets, 'mice'));      // true

// Exercise 2

// Write a function, incrementProperty, that takes two arguments: an Object
// and a String. If the Object contains a property with the specified name, the
// function should increment the value of that property. If the property doesn't
// exist, the function should add a new property with a value of 1. The function
// should return the new value of the property.

function incrementProperty(obj, string) {
  var keys = Object.keys(obj);
  if (keys.indexOf(string) !== -1) {
    obj[string] += 1;
  } else {
    obj[string] = 1;
  }
  return obj[string];
}

var wins = {
  steve: 3,
  susie: 4,
};

console.log('Ex 2');
console.log(incrementProperty(wins, 'susie'));   // 5
console.log(wins);                               // { steve: 3, susie: 5 }
console.log(incrementProperty(wins, 'lucy'));    // 1
console.log(wins);                               // { steve: 3, susie: 5, lucy: 1 }

// Exercise 3

// Write a function, copyProperties, that takes two Objects as arguments.
// The function should copy all of the properties from the first object
// to the second one. The function should return the number of properties
// that were copied.

function copyProperties(obj1, obj2) {
  for (var key in obj1) {
    obj2[key] = obj1[key];
  }
  return Object.keys(obj1).length;
}

console.log('Ex3');

var hal = {
  model: 9000,
  enabled: true,
};

var sal = {};
console.log(copyProperties(hal, sal));  // 2
console.log(sal);  

// Exercise 4

// Write a function, wordCount, that takes a single String as an argument.
// The function should return an Object containing the count of how many
// times each word appears in the provided String. The Object's keys should
// be the words, and the value of each key should be how many ocurrances of
// that word there were.

function wordCount(string) {
  var words = string.split(' ');
  var wordsObj = {};
  for (var word in words) {
    incrementProperty(wordsObj, words[word]);
  }  
  
  return wordsObj;
}

console.log('Ex4');
console.log(wordCount('box car cat bag box'));    // { box: 2, car: 1, cat: 1, bag: 1 }