// total_square_area

var totalArea = function(array) {
  var areaArrays = array.map(function(obj) {
    return rectangleArea(obj);
  });
  
  return areaArrays.reduce(function(acum, value) {
    return acum += value;
  });
};

var rectangleArea = function(rectangleArray) {
  return rectangleArray[0] * rectangleArray[1];
};

var rectangles = [[3, 4], [6, 6], [1, 8], [9, 9], [2, 2]];

console.log(totalArea(rectangles));

// --------------------------------------------------

var totalSquareArea = function(array) {
  var conditionedAreasArray = array.map(function(square) {
    if (square[0] === square[1]) {
      return square[0] * square[1];
    } else {
      return 0;
    }
  });
  
  return conditionedAreasArray.reduce(function(accum, value) {
    return accum += value;
  })
};

var rectangles = [[3, 4], [6, 6], [1, 8], [9, 9], [2, 2]];

console.log(totalSquareArea(rectangles)); // 121