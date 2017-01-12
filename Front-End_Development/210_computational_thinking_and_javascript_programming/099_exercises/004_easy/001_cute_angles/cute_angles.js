// Cute angles

function dms(degrees) {
  var d = Math.floor(degrees);
  var m = Math.floor((degrees - d) * 60);
  var s = Math.floor((degrees - d) * 3600);
  
  return '' + d + '°' + format(m) + '\'' + format(s) +'\"';
}

function format(number) {
  var string = (number.toString().length > 1) ? number : '0' + number;
  return string;
}

console.log(dms(30));        // 30°00'00"
console.log(dms(76.73));     // 76°43'48"
console.log(dms(254.6));     // 254°35'59"
console.log(dms(93.034773)); // 93°02'05"
console.log(dms(0));         // 0°00'00"
console.log(dms(360));       // 360°00'00" or 0°00'00"