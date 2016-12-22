// Operators

/* 
  Aritmetic operators

  +
  -
  *
  /
  %

*/

/*
  Assignment operators
  
  Name                          Shorthand           Meaning
  ---------------------------------------------------------
  Assignment                    a = b               a = b
  Addittion Assignment          a += b              a = a + b
  Substraction Assignment       a -= b              a = a - b
  Multiplication Assignment     a *= b              a = a * b
  Division Assignment           a /= b              a = a / b
  Remainder Assignment          a %= b              a = a % b

*/

/*
  Comparison operators
  
  Operator                    Description
  ----------------------------------------------------------------
  Equal (==)                  Returns true if the operands are equal
  Not Equal (!=)              Returns true if the operands are not equal
  Strict Equal (===)          Returns true if the operands are equal and of the same type
  Strict Not Equal (!==)      Returns true if the operands are not equal and of the same type
  Greater than (>)
  Less than (<)
  
*/

// String operators

'a' < 'b';           // true
'Ant' > 'Falcon';    // false
// Strings are compared based on standard lexicographical ordering, using Unicode values.

// shorthand concatenation

var a = 'Hello';
a += ', World!';

a;                  // "Hello, World!"


/*
  Logical operators
  
  &&  and
  ||  or
  !   not
  
  
*/

false && [];    // false
false || [];    // true
![];            // false