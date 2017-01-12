// Bannerizer

function printInBox(string) {
  console.log('+' + '-'.repeat(string.length + 2) + '+');
  console.log('|' + ' '.repeat(string.length + 2) + '|');
  console.log('| ' + string + ' |');
  console.log('|' + ' '.repeat(string.length + 2) + '|');
  console.log('+' + '-'.repeat(string.length + 2) + '+');
}

printInBox('To boldly go where no one has gone before.');
printInBox('');