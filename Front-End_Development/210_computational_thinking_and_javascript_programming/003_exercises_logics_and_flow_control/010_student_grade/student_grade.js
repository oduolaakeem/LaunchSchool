// Student grade

function studentGrade() {
  var scores = [0, 0, 0];
  var average;
  var grade;
  var total = 0;
  var i = 0;
  
  while (i < 3) {
    scores[i] = Number(prompt('Enter score ' + (i + 1) + ': '));
    total += scores[i];
    i++;
  }
  
  average = total / scores.length;
  
  if (average >= 90) {
    grade = 'A';
  } else if (average >= 70) {
    grade = 'B';
  } else if (average >= 50) {
    grade = 'C';
  } else {
    grade = 'F';
  }
  
  console.log('Based on the average of your 3 scores your grade is \"' + grade + '\"');
}