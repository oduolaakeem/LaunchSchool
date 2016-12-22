// Stepping through object properties

var nicknames = {
  joseph: 'Joey',
  margaret: 'Maggie',
};

for (var nick in nicknames) {
  console.log(nick);
  console.log(nicknames[nick]);
}

// We can also get the names of all the properties in an object using Object.keys()

console.log(Object.keys(nicknames));