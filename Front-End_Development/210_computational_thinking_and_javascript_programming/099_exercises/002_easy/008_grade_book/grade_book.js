// Grade Book

function getGrade(grade1, grade2, grade3) {
  var finalGrade = (grade1 + grade2 + grade3) / 3.0;
  
  if (finalGrade >= 90 && finalGrade <= 100) {
    return 'A';
  } else if (finalGrade >= 80) {
    return 'B';
  } else if (finalGrade >= 70) {
    return 'C';
  } else if (finalGrade >= 60) {
    return 'D';
  } else {
    return 'F';
  }
}

console.log(getGrade(95, 90, 93)) // "A"
console.log(getGrade(50, 50, 95)) // "D"