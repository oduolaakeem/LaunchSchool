// Grocery list

function buyFruit(array) {
  return [].concat(array).reduce(function(acum, value) {
    for (var i = 0; i < value[1]; i++) {
      acum.push(value[0]);
    }
    return acum;
  }, [])
}

console.log(buyFruit([['apples', 3], ['orange', 1], ['bananas', 2]]));
// result
// ['apples', 'apples', 'apples', 'orange', 'bananas','bananas']