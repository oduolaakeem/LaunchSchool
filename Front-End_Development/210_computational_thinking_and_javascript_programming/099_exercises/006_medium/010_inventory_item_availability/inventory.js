// Inventory Item Availability

function isItemAvailable(item, transactions) {
  var itemQuantity = transactionsFor(item, transactions).reduce(function(acum, transaction) {
    var quantity;
    
    if (transaction.movement === 'in') {
      quantity = transaction.quantity;
    } else if (transaction.movement === 'out') {
      quantity = -transaction.quantity;
    }
    
    return acum + quantity;
  }, 0);
  
  return itemQuantity > 0;
}

function transactionsFor(item, transactions) {
  return transactions.filter(function(transaction) {
    return transaction['id'] === item;
  });
}

var transactions = [ {id: 101, movement: 'in', quantity: 5, },
                     {id: 105, movement: 'in', quantity: 10, },
                     {id: 102, movement: 'out', quantity: 17, },
                     {id: 101, movement: 'in', quantity: 12, },
                     {id: 103, movement: 'out', quantity: 15, },
                     {id: 102, movement: 'out', quantity: 15, },
                     {id: 105, movement: 'in', quantity: 25, },
                     {id: 101, movement: 'out', quantity: 18, },
                     {id: 102, movement: 'in', quantity: 22, },
                     {id: 103, movement: 'out', quantity: 15, },];

console.log(isItemAvailable(101, transactions)); // false
console.log(isItemAvailable(105, transactions)); // true