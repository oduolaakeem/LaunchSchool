// Anagrams

function anagram(word, list) {
  var anagrams = list.filter(function(candidate) {
    return areAnagrams(word, candidate);
  });
  
  return anagrams;
}

function areAnagrams(word1, word2) {
  var array1 = wordToSortedLetters(word1);
  var array2 = wordToSortedLetters(word2);
  return compareArrays(array1, array2);
}

function wordToSortedLetters(word) {
  return word.split('').sort();
}

function compareArrays(array1, array2) {
  return array1.join('') === array2.join('');
}

console.log(anagram('listen', ['enlists', 'google', 'inlets', 'banana'])); /// ["inlets"]
console.log(anagram('listen', ['enlist', 'google', 'inlets', 'banana'])); /// ["enlist", "inlets"]