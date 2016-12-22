// Odd Numbers

// Print all odd numbers from 1 to 99, inclusive. Print all numbers on separate lines.

var counter = 1;

while (counter <= 99) {
  if (counter % 2 != 0) {
    console.log(counter);
  }
  
  counter += 1;
}