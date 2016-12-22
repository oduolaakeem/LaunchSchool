// Implicit primitive type coercions

1 + true       // true is coerced into a number, which is 1, so the result is 2
'4' + 3        // 3 is coerced into a string, which is "3", so the result is "43"
false == 0     // false is coerced into a number, which is 0, so the result is true

// Unary plus operator

+('123')        // 123
+('')           // 0
+(null)         // 0
+('a')          // NaN

// Binary plus operator

1 + true        // 2
'123' + 123     // "123123" - if a string is present, coerce for string concatenation
123 + "123"     // "123123"
'a' + null      // "anull" - null is coerced to string

// Other operators

1 - true        // 0
'123' * 3       // 369 - the string is coerced to a number
'8' - "1"       // 7

// Relational operators

11 > '9'        // true - "9" is coerced to 9
123 > 'a'       // false - "a" is coerced to NaN; any number comparison with NaN is false
123 <= 'a'      // also false :(

// Equality operators

0 == false        // true - false is coerced into number 0
'' == undefined   // false - undefined is coerced to "undefined"
'' == 0           // true - "" is coerced to 0
true == 1         // true - comparison of a boolean and a non-boolean will coerce the boolean to a number
'true' == true    // false, and source of many bugs

0 === false        // false
'' === undefined   // false
'' === 0           // false
true === 1         // false
'true' === true    // false