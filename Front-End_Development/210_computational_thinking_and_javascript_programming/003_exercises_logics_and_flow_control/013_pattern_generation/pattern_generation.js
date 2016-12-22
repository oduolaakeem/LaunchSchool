// Pattern Generation

function generatePattern(value) {
  var pattern = '';
  var pattern_copy;
  for (var i = 1; i <= value; i++) {
    pattern += '' + i;
    pattern_copy = pattern;
    for (var j = i; j < value; j++) {
      pattern_copy += '*'; 
    }
    console.log(pattern_copy);
  }
}