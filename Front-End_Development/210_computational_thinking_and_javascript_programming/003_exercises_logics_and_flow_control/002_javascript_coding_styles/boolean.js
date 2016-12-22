// Javascript coding styles

// Boolean

var age = 0;

// bad
var hasAge = new Boolean(age);

// good
var hasAge = Boolean(age);

// best
var hasAge = !!age;