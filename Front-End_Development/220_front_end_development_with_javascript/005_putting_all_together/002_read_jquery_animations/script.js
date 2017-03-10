// Animation using plain javascript

// var frame_length = 13;     // delay between each frame in milliseconds
// var speed = 400;           // duration of animation in milliseconds
// var steps = Math.round(speed / frame_length);
// var end_top = 250;
// var end_left = 500;
// var $p = document.querySelector('p'); // `p` has "position: absolute" for this snippet
// var i = 0;

// var update = function() {
//   $p.style.top = end_top * (i / steps) + 'px';
//   $p.style.left = end_left * (i / steps) + 'px';
//   i++;
//   i < steps && setTimeout(update, frame_length);
// };

// update();  // kick off the animation loop

// ---------------------------------------------------------------

// Animation using jquery

var $p = $('p');
$p.fadeOut();
$p.fadeIn();
$p.fadeToggle();
$p.fadeTo(400, .5);

$p.slideDown();
$p.slideUp(250);
$p.slideToggle(400, function() {
  console.log('Sliding complete!');
});

$p.slideToggle(400, 'linear', function() {
  console.log('Sliding complete!');
});

$p.slideToggle(400, 'linear', function() {
  console.log('Sliding complete!');
});

$p.animate({
  left: 500,
  top: 250
}, 400, function() {
  $(this).text('All done!');
});

$p.slideUp(250).delay(500).slideDown(250);