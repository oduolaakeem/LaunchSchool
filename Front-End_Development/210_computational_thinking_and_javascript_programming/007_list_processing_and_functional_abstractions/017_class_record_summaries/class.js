// Class Records Summaries

var studentScores = {
  student1: {
    id: 123456789,
    scores: {
      exams: [90, 95, 100, 80],
      exercises: [20, 15, 10, 19, 15],
    },
  },
  student2: {
    id: 123456799,
    scores: {
      exams: [50, 70, 90, 100],
      exercises: [0, 15, 20, 15, 15],
    },
  },
  student3: {
    id: 123457789,
    scores: {
      exams: [88, 87, 88, 89],
      exercises: [10, 20, 10, 19, 18],
    },
  },
  student4: {
    id: 112233445,
    scores: {
      exams: [100, 100, 100, 100],
      exercises: [10, 15, 10, 10, 15],
    },
  },
  student5: {
    id: 112233446,
    scores: {
      exams: [50, 80, 60, 90],
      exercises: [10, 0, 10, 10, 0],
    },
  },
};

function generateClassRecordSummary(studentScores) {
  var summary = {
    studentGrades: [],
    exams: []
  };
  
  var exams = [];
  
  Object.keys(studentScores).forEach(function(key) {
    var score = getStudentScore(studentScores[key].scores);
    summary.studentGrades.push(formatScore(score));
    
    exams.push([]);
    
    studentScores[key].scores.exams.forEach(function(value) {
      exams[exams.length - 1].push(value);
    });
  });
  
  summary.exams = examsSummary(exams);
  
  return summary;
}

function getStudentScore(scores) {
  var examsScore = 0.0;
  var exercisesScore = 0.0;
  
  scores.exams.forEach(function(value) {
    examsScore += value;
  });
  
  scores.exercises.forEach(function(value) {
    exercisesScore += value;
  });

  examsScore /= scores.exams.length;
  
  return Math.round((examsScore * 0.65) + (exercisesScore * 0.35));
}

function formatScore(score) {
  if (score >= 93) {
    return score + ' (A)';
  } else if (score >= 85) {
    return score + ' (B)';
  } else if (score >= 77) {
    return score + ' (C)';
  } else if (score >= 69) {
    return score + ' (D)';
  } else if (score >= 60) {
    return score + ' (E)';
  } else {
    return score + ' (F)';
  }
}

function examsSummary(exams) {
  var examsSum = [];
  var examsTranspose = [];
  
  // transpose the array;
  for (var i = 0; i < exams[0].length; i++) {
    examsTranspose.push([]);  
  }
  
  exams.forEach(function(array) {
    for (var i = 0; i < exams[0].length; i++) {
      examsTranspose[i].push(array[i]);
    }
  });
  
  examsTranspose.forEach(function(exam) {
    var average = exam.reduce(function(a, b) { return a + b}) / exam.length;
    
    examsSum.push({});
    var index = examsSum.length - 1;
    examsSum[index].average = parseFloat(average.toFixed(1));
    examsSum[index].minimum = exam.sort(compareFunction)[0];
    examsSum[index].maximum = exam.sort(compareFunction)[exam.sort(compareFunction).length - 1];
  });
  
  return examsSum;
}

function compareFunction(a, b) {
  return a - b;
}

console.log(generateClassRecordSummary(studentScores));

// returns:

// {
//   studentGrades: [ '87 (B)', '73 (D)', '84 (C)', '86 (B)', '56 (F)' ],
//   exams: [
//     { average: 75.6, minimum: 50, maximum: 100 },
//     { average: 86.4, minimum: 70, maximum: 100 },
//     { average: 87.6, minimum: 60, maximum: 100 },
//     { average: 91.8, minimum: 80, maximum: 100 },
//   ],
// }