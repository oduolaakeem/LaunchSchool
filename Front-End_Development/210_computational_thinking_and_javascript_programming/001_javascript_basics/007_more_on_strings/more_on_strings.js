// More on strings

// Special characters

var multiline = 'This string...\nspans multiple lines';

/*

Code    Character
-----------------
\n      New line
\t      Tab
\r      Carriage return
\v      Vertical tab
\b      Backspace

*/

// Escaping standard charachters

var quote = '\"It is hard to fail, but it is worse never to have tried to succeed.\" - Theodore Roosvelt';

// Character access

'hello'.charAt(1);  // "e"

'hello'[1];         // "e"

// String length

'hello'.length;     // "5"

// Working with long strings

// Concatenating
var lipsum = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do ' +
             'eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut ' +
             'enim ad minim veniam, quis nostrud exercitation ullamco laboris ' +
             'nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor ' +
             'in reprehenderit in voluptate velit esse cillum dolore eu fugiat ' +
             'nulla pariatur. Excepteur sint occaecat cupidatat non proident, ' +
             'sunt in culpa qui officia deserunt mollit anim id est laborum.';
             
// Escaping
var lipsum = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do \
eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut \
enim ad minim veniam, quis nostrud exercitation ullamco laboris \
nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor \
in reprehenderit in voluptate velit esse cillum dolore eu fugiat \
nulla pariatur. Excepteur sint occaecat cupidatat non proident, \
sunt in culpa qui officia deserunt mollit anim id est laborum.';

