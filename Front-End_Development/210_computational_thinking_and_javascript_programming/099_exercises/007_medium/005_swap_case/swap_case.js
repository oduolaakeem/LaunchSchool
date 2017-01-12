// Swap Case

function swapcase(string) {
  return string.split('').map(function(char) {
    if (char.match(/[A-Z]/i)) {
      return char.match(/[A-Z]/) ? char.toLowerCase() : char.toUpperCase();
    } else {
      return char;
    }
  }).join('');
}

console.log(swapcase('CamelCase'));         // 'cAMELcASE'
console.log(swapcase('Tonight on XYZ-TV')); // 'tONIGHT ON xyz-tv'