// Multiples of 3 and 5

function multiplesOfThreeAndFive(min, max) {
  for (var i = min; i <= max; i++) {
    if (i % 5 == 0 && i % 3 == 0) {
      console.log(i + '!');
    } else if (i % 5 == 0 || i % 3 == 0) {
      console.log(i);
    }
  }
}