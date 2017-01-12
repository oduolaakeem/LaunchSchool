// Staggered case part 2

function staggeredCase(string) {
  var upperCase = false;
  
  return string.split('').map(function(char, index) {
    if (char.match(/[a-z]/i)) {
      if (upperCase) {
        upperCase = false;
        return char.toLowerCase();
      } else {
        upperCase = true;
        return char.toUpperCase();
      }
    } else {
      return char;
    }
  }).join('');
}

console.log(staggeredCase('I Love Launch School!'));     // 'I lOvE lAuNcH sChOoL!'
console.log(staggeredCase('ALL CAPS'));                  // 'AlL cApS'
console.log(staggeredCase('ignore 77 the 444 numbers')); // 'IgNoRe 77 ThE 444 nUmBeRs'