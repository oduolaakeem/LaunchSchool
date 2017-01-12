// Capitalize words

function wordCap(string) {
  return string.split(' ').map(function(word) {
    return word.replace(/(^|\s)\b[a-z]/, word.charAt(0).toUpperCase());
  }).join(' ');
}

console.log(wordCap('four score and seven'));    // 'Four Score And Seven'
console.log(wordCap('the javaScript language')); // 'The Javascript Language'
console.log(wordCap('this is a "quoted" word')); // 'This Is A "quoted" Word'