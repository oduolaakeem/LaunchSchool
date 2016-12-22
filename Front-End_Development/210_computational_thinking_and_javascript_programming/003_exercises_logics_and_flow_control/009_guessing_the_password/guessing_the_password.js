// Guessing the password

function logIn() {
  var password = 'lucas'
  var user_input;
  var counter = 0;
  while (counter < 3) {
    user_input = prompt('What is the password: ');
    if (password === user_input) {
      console.log('You have successfully logged in.')
      return true
    } else {
      counter++;
    }
  }
  console.log('You have been denied access.')
  return false;
}