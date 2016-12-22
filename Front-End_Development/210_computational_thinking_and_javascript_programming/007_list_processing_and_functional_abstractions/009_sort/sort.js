// Sort

function compareScores(score1, score2) {
  if (score1 < score2) {
    return -1;
  } else if (score1 > score2) {
    return 1;
  } else {
    return 0;
  }
}

var scores = [88, 50, 60, 99, 12, 23];
scores.sort(compareScores);            // [ 12, 23, 50, 60, 88, 99 ]
scores;                                // mutated to [ 12, 23, 50, 60, 88, 99 ]