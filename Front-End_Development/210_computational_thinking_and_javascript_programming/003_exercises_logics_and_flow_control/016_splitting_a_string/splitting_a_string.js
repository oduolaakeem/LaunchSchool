// Splitting a string

function splitString(string, delimiter) {
  var copy_string;
  
  copy_string = '';
  
  for (var i = 0; i < string.length; i++) {
    if (string[i] == delimiter) {
      if (!!copy_string) {
        console.log(copy_string)
      }
      copy_string = '';
      continue;
    } else if (!!!delimiter) {
      console.log(string[i])  
    } else {
      copy_string += string[i];
    }
    
    
  }
  console.log(copy_string);
}