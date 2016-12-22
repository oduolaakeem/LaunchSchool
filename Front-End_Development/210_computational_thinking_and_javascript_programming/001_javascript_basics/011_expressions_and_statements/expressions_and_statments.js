// Examples of expressions

'hello';        // a single strin is an expression
10 + 13;        // arithmetic operations are expressions
sum = 10;       // assignments are expressions

var a;
var b;
var c;

a = 3;
b = 10 + 3;
c = (a + (3 + b));

var a;
var b;
var c;

a = 1;
b = a++;    // equivalent of "b = a; a++;". so now b is 1 and a is 2
c = ++a;    // equivalent of "++a; c = a;". so now c is 3 and a is 3

var a = true;
var b = false;

a || (b = true);      // b is still false after this, because (b = true) is never evaluated
b && (a = 1);         // a is still true after this, because (a = 1) is never evaluated