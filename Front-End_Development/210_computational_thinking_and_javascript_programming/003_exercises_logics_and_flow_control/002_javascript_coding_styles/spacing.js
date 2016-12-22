// Javascript coding styles

// Spacing

// bad
function foo() {
∙∙∙∙var name;
}

// bad
function bar() {
∙var name;
}

// good
function baz() {
∙∙var name;
}

// Place 1 space before the leading brace

// bad
function test(){
  console.log('test');
}

// good
function test() {
  console.log('test');
}

// Place 1 space in control statements before the parenthesis, prevent to put 1 space after function and
// parentheses

// bad
if(isJedi) {
  fight ();
}

// good
if (isJedi) {
  fight();
}

// bad
function fight () {
  console.log ('Swooosh!');
}

// good
function fight() {
  console.log('Swooosh!');
}

// Set off operators with spaces

// bad
var x=y+5;

// good
var x = y + 5;

// Do not add spaces inside parentheses

// bad
function bar( foo ) {
  return foo;
}

// good
function bar(foo) {
  return foo;
}

// bad
if ( foo ) {
  console.log(foo);
}

// good
if (foo) {
  console.log(foo);
}

// Unary special-character operators eg !, ++ must not have space next to their operand

// bad
index ++;

// good
index++;

// Any , and ; must not have preceding space

// bad
func(a ,b) ;

// good
func(a, b);

// No Whitespace at the end of line or on blank lines

// bad
func(a, b);∙

// good
func(a, b);

// The ? and : in a ternary conditional must have space on both sides

// bad
var maybe1 > maybe2?'bar":null;

// good
var maybe1 > maybe2 ? 'bar" : null;

// Ternaries should not be nested and generally be single line expressions

// bad
const foo = maybe1 > maybe2
  ? "bar"
  : value1 > value2 ? "baz" : null;

// better
const maybeNull = value1 > value2 ? 'baz' : null;

const foo = maybe1 > maybe2
  ? 'bar'
  : maybeNull;

// best
const maybeNull = value1 > value2 ? 'baz' : null;

const foo = maybe1 > maybe2 ? 'bar' : maybeNull;

// Avoid unneeded ternary statements

// bad
const foo = a ? a : b;
const bar = c ? true : false;
const baz = c ? false : true;

// good
const foo = a || b;
const bar = !!c;
const baz = !c;