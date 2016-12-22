// Matching parentheses

function isBalanced(string) {
  var parenthesesCount = 0;
  for (var i = 0; i < string.length; i++) {
    if (string[i] === '(') {
      parenthesesCount += 1;
    } else if (string[i] === ')') {
      parenthesesCount -= 1;
    }
    
    if (parenthesesCount < 0) {
      return false;
    }
  }
  
  return parenthesesCount === 0;
}

console.log(isBalanced('What (is) this?'));        // true
console.log(isBalanced('What is) this?'));         // false
console.log(isBalanced('What (is this?'));         // false
console.log(isBalanced('((What) (is this))?'));    // true
console.log(isBalanced('((What)) (is this))?'));   // false
console.log(isBalanced('Hey!'));                   // true
console.log(isBalanced(')Hey!('));                 // false
console.log(isBalanced('What ((is))) up('));       // false