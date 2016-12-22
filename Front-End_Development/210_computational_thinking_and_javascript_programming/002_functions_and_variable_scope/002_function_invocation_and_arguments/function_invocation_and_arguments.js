// function invocation and arguments

function startle() {
  console.log('Yikes!');
}

startle();

var surprise = startle;

surprise();

function takeTwo(a, b) {
  console.log(a);
  console.log(b);
  console.log(a + b);
}

takeTwo(1, 2);

// Only passing one argument. The missing arguments are assigned as undefined.

takeTwo(1);

// Passing more arguments than parameters defined in the function. The extra arguments are ignored.

takeTwo(1, 2, 4);