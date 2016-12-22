// Print multiples

function printMultiples(number) {
  var i = 1;
  var result = i * number;
  var array = [];
  while (result <= 100) {
    if (result % 2 != 0) {
      array = array.concat(i * number); 
    }
    i++;
    result = i * number;
  }
  
  array = array.reverse();
  for (i = 0; i < array.length; i++) {
    console.log(array[i]);
  }
}