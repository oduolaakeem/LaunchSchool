// Preventing Errors

function lowerInitial(word) {
  return word[0].toLowerCase();
}

lowerInitial("Joe");       // "j"
lowerInitial("Karen");     // "k"

lowerInitial("");          // TypeError: Cannot read property 'toLowerCase' of undefined

// Guard Clause

function lowerInitial(word) {
  if (word.length === 0) {          // If word contains an empty String,
    return '-';                     // return a dash instead of proceeding.
  }
  return word[0].toLowerCase();     // At this point, word is guaranteed to have
}                                   // a length of at least 1, so word[0]
                                    // can never evaluate to undefined.