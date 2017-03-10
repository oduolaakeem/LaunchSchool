// script.js

var canvas = document.createElement("canvas");
var ctx = canvas.getContext("2d");
var div = null;

var manipulator = {
  images: ["1.jpg", "2.jpg", "3.jpg"],

  loadImages: function() {
    this.images.forEach(function(src) {
      var $img = $("<img>").attr("src", src);
      var gray;

      $img.on("load", function() {
        canvas.width = $img[0].width;
        canvas.height = $img[0].height;
        ctx.drawImage($img[0], 0, 0, $img[0].width, $img[0].height);
        gray = manipulator.grayscale($img[0]);
        $("#column2").append(gray);
      });
    });
  },

  grayscale: function(img) {
    var image_data = ctx.getImageData(0, 0, canvas.width, canvas.height);
    var gray;

    for (var i = 0; i < image_data.data.length; i += 4) {
      gray = (image_data.data[i] * 0.3086) + (image_data.data[i + 1] * 0.6094) + (image_data.data[i + 2] * 0.0820);
      image_data.data[i] = gray;
      image_data.data[i + 1] = gray;
      image_data.data[i + 2] = gray;
    }
    ctx.putImageData(image_data, 0, 0);
    return $("<img>").attr("src", canvas.toDataURL())[0];
  },

  init: function() {
    this.loadImages();
  },
}

$(window).on("load", manipulator.init.apply(manipulator));
