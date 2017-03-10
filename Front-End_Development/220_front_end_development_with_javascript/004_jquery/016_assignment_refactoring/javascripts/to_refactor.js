$(function() {
  $("nav a").on("mouseenter", function() {
    $(this).next("ul").css({
      display: "block"
    });
  });

  $("nav").on("mouseleave", function() {
    $(this).find("ul ul").css({
      display: "none"
    });
  });

  $(".button").on("click", function(e) {
    e.preventDefault();

    $(this).addClass("clicked");
  });

  $("button").on("click", function() {
    $(this).addClass("clicked");
  });

  $(".toggle").on("click", function(e) {
    e.preventDefault();

    $(this).next(".accordion").toggleClass("opened");
  });

  $("form").on("submit", function(e) {
    e.preventDefault();
    var cc_number = $(this).find("[type=text]").val(),

    cc_number_sum = creditCardEvenOddSum(cc_number);
    
    if (cc_number_sum % 10 == 0) {
      $(this).find(".success").show();
      $(this).find(".error").hide();
    }
    else {
      $(this).find(".error").show();
      $(this).find(".success").hide();
    }
  });

  $("ul").on("click", "a", function(e) {
    e.preventDefault();

    var month = $(e.target).text(),
        $stone = $("#birthstone");

    var referenceTable = {
      January: "Your bithstone is garnet",
      February: "Your bithstone is amethyst",
      March: "Your bithstone is aquamarine or bloodstone",
      April: "Your bithstone is diamond",
      May: "Your bithstone is emerald",
      June: "Your bithstone is pearl, moonstone, or alexandrite",
      July: "Your bithstone is ruby",
      August: "Your bithstone is peridot",
      September: "Your bithstone is sapphire",
      October: "Your bithstone is opal or tourmaline",
      November: "Your bithstone is topaz or citrine",
      December: "Your bithstone is turquoise, zircon, or tanzanite",
    };
    
    $stone.text(referenceTable[month]);
  });
});

function creditCardEvenOddSum(cc_number) {
  cc_number = cc_number.split("").reverse();
  var even_total = 0;
  var odd_total = 0;
  
  for (var i = 0, len = cc_number.length; i < len; i++) {
    if (i % 2 == 1) {
      cc_number[i] = (+cc_number[i] * 2) + "";
      if (cc_number[i].length > 1) {
        cc_number[i] = +cc_number[i][0] + +cc_number[i][1];
      }
      else {
        cc_number[i] = +cc_number[i];
      }
      odd_total += cc_number[i];
    }
    else {
      even_total += +cc_number[i];
    }
  }
  
  return even_total + odd_total;
}
