// Staggered Caps Part 1

function staggeredCase(string) {
  var upperCase = false;
  
  return string.split('').map(function(char, index) {
    if (char.match(/[a-z]/i)) {
      return index % 2 === 0 ? char.toUpperCase() : char.toLowerCase();
    } else {
      return char;
    }
  }).join('');
}

console.log(staggeredCase('I Love Launch School!'));     // 'I LoVe lAuNcH ScHoOl!'
console.log(staggeredCase('ALL_CAPS'));                  // 'AlL_CaPs'
console.log(staggeredCase('ignore 77 the 444 numbers')); // 'IgNoRe 77 ThE 444 NuMbErS'