// Letter counter

function wordSizes(string) {
  var wordSizeContainer = {};
  
  string.replace(/[^a-z0-9\s]/ig, '').split(' ').forEach(function(word) {
    if (!Object.keys(wordSizeContainer).includes(word.length.toString())) {
      wordSizeContainer[word.length.toString()] = 1;
    } else {
      wordSizeContainer[word.length.toString()] += 1;
    }
  });
  
  return wordSizeContainer;
}

console.log(wordSizes('Four score and seven.'));                       // { "3": 1, "4" : "1", "5": 1, "6": 1 }
console.log(wordSizes('Hey diddle diddle, the cat and the fiddle!'));  // { "3": 5, "6": 1, "7": 2 }
console.log(wordSizes('What\'s up doc?'));                             // { "6": 1, "2": 1, "4": 1 }
console.log(wordSizes(''));                                            // {}console.log()