// Primitive values are immutables

var a;

a = 'hello';
a.toUpperCase();      // the "hello" string is not mutated, but new "HELLO" string is returned
a;                    // still 'hello'