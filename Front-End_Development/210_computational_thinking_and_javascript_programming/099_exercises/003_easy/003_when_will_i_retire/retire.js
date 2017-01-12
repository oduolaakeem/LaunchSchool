// When will i retire

function retire() {
  var age = parseInt(prompt('What is your age? '));
  var retirementAge = parseInt(prompt('At what age would you like to retire? '));
  var today = new Date;
  var retirementYear = today.getFullYear() + (retirementAge - age);
  
  console.log('It\'s ' + today.getFullYear() + '. You will retire in ' + retirementYear + '.');
  console.log('You have only ' + (retirementAge - age) + ' years of work to go!')
}