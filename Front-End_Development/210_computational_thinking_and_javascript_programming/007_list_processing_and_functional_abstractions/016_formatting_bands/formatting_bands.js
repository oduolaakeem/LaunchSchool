// Formatting bands

function processBands(data) {
  return data.map(function(band) {
    band.name = removeDotsFromBandName(band.name);
    band.name = capitalizeBandName(band.name);
    band.country = 'Canada';
    return {name: band.name, country: band.country, active: band.active};
  })
}

function removeDotsFromBandName(name) {
  return name.replace('.', '');
}

function capitalizeBandName(name) {
  return name.split(' ').map(function(word) {
    return word.replace(word[0], word[0].toUpperCase());
  }).join(' ');
}

var bands = [
  { name: 'sunset rubdown', country: 'UK', active: false },
  { name: 'women', country: 'Germany', active: false },
  { name: 'a silver mt. zion', country: 'Spain', active: true },
];

console.log(processBands(bands));

