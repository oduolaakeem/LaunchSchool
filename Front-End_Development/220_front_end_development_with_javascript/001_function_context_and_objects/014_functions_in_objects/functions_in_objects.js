// Functions in objects

var me = {
  firstName: 'Lucas',
  lastName: 'Ochoa',
};

function fullName(person) {
  console.log(person.firstName + ' ' + person.lastName); 
}

var friend = {
  firstName: 'Marco',
  lastName: 'Arango',
};

var mother = {
  firstName: 'Monica',
  lastName: 'Munoz',
};

var father = {
  firstName: 'Diego',
  lastName: 'Ochoa',
};

var people = [];

people.push(me);
people.push(friend);
people.push(mother);
people.push(father);

function rollCall(collection) {
  collection.forEach(fullName);
}

var people = {
  collection: [me, friend, mother, father],
  
  fullName: function(person) {
    console.log(person.firstName + ' ' + person.lastName);
  },
  
  rollCall: function() {
    this.collection.forEach(this.fullName);
  },
  
  add: function(person) {
    if (this.isInvalidPerson(person)) {
      return;
    }
    
    this.collection.push(person);
  },
  
  get: function(person) {
    if (this.isInvalidPerson(person)) {
      return;
    }
    
    return this.collection[this.getIndex(person)];
  },
  
  update: function(person) {
    if (this.isInvalidPerson(person)) {
      return;
    }
    
    var existingPersonId = this.getIndex(person);
    
    if (existingPersonId === -1) {
      this.add(person);
    } else {
      this.collection[existingPersonId] = person;
    }
  },
  
  remove: function(person) {
    if (this.isInvalidPerson(person)) {
      return;
    }
    
    var index = this.getIndex(person);
    var leftSide;
    var rightSide;
    
    if (index === -1) {
      return;
    }
    
    leftSide = this.collection.slice(0, index);
    rightSide = this.collection.slice(index + 1);
    
    this.collection = leftSide.concat(rightSide);
  },
  
  getIndex: function(person) {
    var index = -1;
    
    this.collection.forEach(function(comparator, i) {
      if (comparator.firstName === person.firstName && comparator.lastName === person.lastName) {
        index = i
      }
    });
    
    return index
  },
  
  isInvalidPerson: function(person) {
    return typeof person.firstName !== 'string' || typeof person.lastName !== 'string';
  },
}

console.log(people.getIndex(friend));
people.remove(friend);
console.log(people.getIndex(friend));