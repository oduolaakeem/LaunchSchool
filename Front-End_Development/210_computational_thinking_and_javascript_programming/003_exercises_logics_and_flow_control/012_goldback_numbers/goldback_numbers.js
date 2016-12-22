// Goldback Numbers

function checkGoldback(value) {
  var found;
  
  if (value < 4 && value % 2 != 0) {
    return null;
  } else {
    for (var i = 1; i < value; i++) {
      for (var j = i; j < value; j++) {
        if (i + j == value && isPrime(i) && isPrime(j)) {
          console.log('' + i + ' ' + j);
          found = true;
        }
      }
    }
  }
  
  if (!found) {
    console.log(null);
  }
}