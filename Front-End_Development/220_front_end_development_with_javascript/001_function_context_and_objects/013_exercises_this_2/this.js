// What is this 2

var myObject = {
  count: 1,
  myChildObject: {
    myMethod: function() {
      return this.count;
    }
  },
};

console.log(myObject.myChildObject.myMethod.apply(myObject));

// What will the following code log out

console.log('-------------');

var a = 1;
var obj = {
  a: 2,
  func: function() {
    console.log(this.a);
  }
}

obj.func();           // 2
obj.func.call();      // 1
obj.func.call(this);  // 1
obj.func(obj);        // 2

var obj2 = {a: 3};
obj.func.call(obj2);  // 3

// What will the following code log out

console.log('---------------');

var a = 1;

function Foo() {
  this.a = 2;
  this.bar = function() {
    console.log(this.a);
  };
  this.bar();
}

var foo = new Foo();
console.log(foo instanceof Foo);
foo.bar();              // 2
Foo();                  // 2

var obj = {};
Foo.call(obj);          // 2
obj.bar();              // 2

console.log(this.a);    // 2

// What will the following code log out

console.log('---------------');

var computer = {
  price: 30000,
  shipping: 2000,
  total: function() {
    var tax = 3000;
    function specialDiscount() {
      if (this.price > 20000) {
        return 1000;
      } else {
        return 0;
      }
    }
    return this.price + this.shipping + tax - specialDiscount.call(this);
  },
};

console.log(computer.total())     // undefined

// If you want this code to log out 34000, how would you fix it?

// What will the code below log out?

console.log('---------------');

var RECTANGLE = {
  area: function() {
    return this.width * this.height;
  },
  circumference: function() {
    return 2 * (this.width + this.height);
  },
};

function Rectangle(width, height) {
  this.width = width;
  this.height = height;
  this.area = RECTANGLE.area.call(this);
  this.circumference = RECTANGLE.circumference.call(this);
}

var rect1 = new Rectangle(2, 3);
console.log(rect1.area);              // NaN
console.log(rect1.circumference);     // NaN

// How to fix the problem?

