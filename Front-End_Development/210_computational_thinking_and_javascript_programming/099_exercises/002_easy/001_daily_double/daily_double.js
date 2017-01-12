// Daily double

function crunch(string) {
  var crunched = '';
  
  crunched = string.split('').reduce(function(a, b){
    if (a.charAt(a.length - 1) !== b) {
      return a + b;
    } else {
      return a;
    }
  }, '');
  
  return crunched;
}

console.log(crunch('ddaaiillyy ddoouubbllee'));        // 'daily double'
console.log(crunch('4444abcabccba'));                  // '4abcabcba'
console.log(crunch('ggggggggggggggg'));                // 'g'
console.log(crunch('a'));                              // 'a'
console.log(crunch(''));                               // ''console.log()