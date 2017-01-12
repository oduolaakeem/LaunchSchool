// Right Triangles

function triangle(number) {
  for (var i = 1; i <= number; i++) {
    console.log(' '.repeat(number - i) + '*'.repeat(i));
  }
}

triangle(5);
triangle(9);
triangle(30);