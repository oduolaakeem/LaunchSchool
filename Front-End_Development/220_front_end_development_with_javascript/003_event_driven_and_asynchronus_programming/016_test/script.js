// script.js

var person = {
  name: 'Andrea',
  
  printName: function() {
    console.log(this.name);
  },
};

function addToTotal(a, b) {
  return this.total + a + b;
}

var box = {
  x: 25,
  y: 42,
  z: 12,
  printVolume: function() {
    // define this method
    
    console.log(this.x * this.y * this.z);
  },
}

box.printVolume();

var paragraphs = document.getElementsByTagName('p');

for (var i = 0; i < paragraphs.length; i++) {
  console.log(paragraphs[i].getAttribute('rel'))
}