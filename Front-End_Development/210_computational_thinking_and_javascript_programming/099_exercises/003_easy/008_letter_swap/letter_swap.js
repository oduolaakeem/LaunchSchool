// Letter swap

function swap(string) {
  return string.split(' ').map(function(word) {
    if (word.length === 1) {
      return word;
    } else if (word.length === 2) {
      return word.charAt(1) + word.charAt(0) + '';
    } else {
      return word.charAt(word.length - 1) + word.substring(1, word.length - 1) + word.charAt(0) + '';
    }
  }).join(' ');
}

console.log(swap('Oh what a wonderful day it is'));    // 'hO thaw a londerfuw yad ti si'
console.log(swap('Abcde'));                            // 'ebcdA'
console.log(swap('a'));                                // 'a'