// How Many

function countOccurrences(array) {
  var copyArray = [].concat(array)
  var count = {}
  
  while (copyArray.length > 0) {
    var currentVehicle = copyArray.pop();
    count[currentVehicle] = count[currentVehicle] + 1 || 1;
  }
  
  Object.keys(count).forEach(function(key) {
    console.log(key + ' => ' + count[key]);
  });
}

var vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck', 'motorcycle', 'motorcycle', 'car', 'truck'];
countOccurrences(vehicles);
