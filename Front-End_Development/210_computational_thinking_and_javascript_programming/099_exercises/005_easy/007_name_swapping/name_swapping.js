// Swap name

function swapName(fullName) {
  var firstName = fullName.split(' ')[0];
  var lastName = fullName.split(' ')[1];
  
  return lastName + ', ' + firstName;
}

console.log(swapName('Joe Roberts')); // 'Roberts, Joe'