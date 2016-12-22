// Looping and iteration

// While loop

// while (condition) {
//   // statements
// }

var counter = 0;
var limit = 10;

while (counter < limit) {
  console.log(counter);
  counter += 2;
}

// Using break to get out
console.log('using break to get out');

counter = 0;

while (true) {
  console.log(counter);
  counter += 2;
  if (counter > limit) {
    break;
  }
}

// Using continue
console.log('Using continue');

counter = 0;

while (true) {
  counter += 2;
  if (counter === 4) {
    continue;
  }

  if (counter > limit) {
    break;
  }

  console.log(counter);
}

// Do while loop
console.log('Do while loop');

counter = 0;
limit = 10;

do {
  console.log(counter);
  counter++;
} while (counter < limit);

// For loop

// for (initialExpression; condittion; incrementExpression) {
  // Statements
// }

console.log('For loop');

for (var i = 0; i < 10; i++) {
  console.log(i);
}

// For with variable initialization outside the loop
console.log('For with var initialization outside the loop');

var i = 0;
for (; i < 10; i++) {
  console.log(i);
}

// For with manual condition check
console.log('For with manual condition check');

for (var i = 0; ; i++) {
  if (i < 10) {
    break;
  }

  console.log(i);
}

// For with manual increment
console.log('For with manual increment');

// manually increment the iterator

for (var i = 0; i < 10; ) {
  console.log(i);
  i++;
}

