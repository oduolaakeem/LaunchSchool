// Searching 101

function searching() {
  var numbers = [];
  var lastNumber;
  
  for (var i = 1; i <= 5; i++) {
    numbers.push(parseInt(prompt('Please enter the ' + cardinal(i) + ' number: ')));
  }
  
  lastNumber = parseInt(prompt('Enter the last number: '));
  
  if (numbers.includes(lastNumber)) {
    console.log('The number ' + lastNumber + ' appears in ' + numbers.toString() + '.');
  } else {
    console.log('The number ' + lastNumber + ' does not appear in ' + numbers.toString() + '.');
  }
}

function cardinal(number) {
  if (number === 1) {
    return number + 'st';
  } else if (number === 2) {
    return number + 'nd';
  } else if (number === 3) {
    return number + 'rd';
  } else {
    return number + 'th';
  }
}