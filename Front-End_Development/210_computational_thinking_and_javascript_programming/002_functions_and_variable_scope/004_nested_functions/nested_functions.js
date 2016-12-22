// Nested Functions

function circumference(radius) {
  function double(number) {   // nested function:
    return number * 2;
  }
  
  return 3.14 * double(radius);   // call the nested function
}

console.log(circumference(3));