// Explicit primitive type coercions

Number('1');  // 1
Number('abc123');  // NaN

parseInt('123');      // 123
parseInt('123.12');   // 123, will only return the whole numbers
parseFloat('123.12'); // 123.12, can handle floating point values

// Now Strings

String(123);    // "123"
String(1.23);   // "1.23"

(123).toString();   // "123"
(123.12).toString();// "123.12"

// Avoid using the following conversion option

123 + '';     // "123"
'' + 123.12;  // "123.12"

// Now with booleans

String(true);     // "true"
String(false);    // "false"

true.toString();  // "true"
false.toString(); // "false"

