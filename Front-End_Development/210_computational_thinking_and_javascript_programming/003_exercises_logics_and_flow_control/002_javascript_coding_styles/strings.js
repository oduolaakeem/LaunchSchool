// Javascript coding styles

// Strings

// Use single quotes for strings

// bad
var name = "Capt. Janeway";

// good
var name = 'Capt. Janeway';

// Use explicit coercion

var a = 9;

// bad
var string = a + '';

// bad
var string = a.toString();

// good
var string = String(a);
