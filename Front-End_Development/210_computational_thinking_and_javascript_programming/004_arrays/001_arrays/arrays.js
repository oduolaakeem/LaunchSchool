// Arrays

[] // an empty Array

[0, 1, 2] // an Array holding three values

[42, 'hello', false, [3, 5], [true, 'hello']] // Arrays can contain any other object

var count = new Array(1, 2, 3);

var count = [1, 2, 3];

var count = [1, 2, 3, 4];
for (var i = 0; i < count.length; i++) {
  console.log(i);
}

var fibbonacci = [0, 1, 1, 2, 3, 5, 8, 13];

fibbonacci[0];     // 0
fibbonacci[3];     // 2
fibbonacci[100];   // undefined

var count = [1, 2, 3];
count[3] = 4;
count;            // [1, 2, 3, 4]
count.length;     // 4

// continue from the previous code snippet
count[5] = 5;
count;          // [ 1, 2, 3, 4, , 5 ]
count[4];       // undefined
count.length;   // 6

var count = [1, 2, 3];

count.length = 10;
count;          // [ 1, 2, 3, , , , , , ,  ]
count.length = 2;
count;          // [ 1, 2 ]

typeof [];      // 'object'

Array.isArray([]);        // true
Array.isArray('array');   // false