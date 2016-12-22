// Low Level Abstractions

function isAllUnique(string) {
  var array1 = string.toLowerCase().replace(' ', '').split('');
  
  var array2 = []
  
  array1.forEach(function(a) {
    if (!array2.includes(a)) {
      array2.push(a);
    }
  });
  
  return array1.join('') === array2.join('');
}

console.log(isAllUnique('The quick brown fox jumped over a lazy dog'));     // false
console.log(isAllUnique('123,456,789'));                                    // false
console.log(isAllUnique('The big apple'));                                  // false
console.log(isAllUnique('The big apPlE'));                                  // false
console.log(isAllUnique('!@#$%^&*()'));                                     // true
console.log(isAllUnique('abcdefghijklmnopqrstuvwxyz'));                     // true