// Century

function century(year) {
  var century = parseInt((((year - 1) / 100) + 1).toString());
  return cardinal(century)
}

function cardinal(century) {
  var units = century % 10;
  var tens = ((century - units) / 10) % 10;
  
  if (tens === 1) {
    return century + 'th';  
  } else {
    if (units === 1) {
      return century + 'st';
    } else if (units === 2) {
      return century + 'nd';
    } else if (units === 3) {
      return century + 'rd';
    } else {
      return century + 'th';
    }
  }
}

console.log(century(2000));        // '20th'
console.log(century(2001));        // '21st'
console.log(century(1965));        // '20th'
console.log(century(256));         // '3rd'
console.log(century(5));           // '1st'
console.log(century(10103));       // '102nd'
console.log(century(1052));        // '11th'
console.log(century(1127));        // '12th'
console.log(century(11201));       // '113th'