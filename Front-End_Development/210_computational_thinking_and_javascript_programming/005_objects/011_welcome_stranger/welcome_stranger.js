// Exercise Welcome Stranger

// Create a function that takes 2 arguments, an array and an object. The array
// will contain 2 or more elements that, when combined with adjoining spaces, produce
// a person's name. The object will contain two keys, title and occupation, and
// the appropriate values. Your function should then display a greeting that uses
// the person's full name, and mentions the persons title.

function greetings() {
  // arguments[0] -> array with 2 or more elements
  // arguments[1] -> object with keys title and occupation
  return 'Hello, ' + arguments[0].join(' ') + '! Nice to have a ' + arguments[1].title + ' ' + arguments[1].occupation + ' around.';
}

console.log(greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' }));