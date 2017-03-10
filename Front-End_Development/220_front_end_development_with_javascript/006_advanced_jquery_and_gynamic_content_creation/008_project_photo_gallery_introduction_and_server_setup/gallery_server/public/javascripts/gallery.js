// gallery.js

var gallery

(function() {
  gallery = {
    url: "https://linux-console-lucasou89.c9users.io",
    id: 1,
    fadeSpeed: 400,
    init: function() {
      this.initializeTemplates();
      this.getPhotos();
      $.when(this.currentRequest).done(this.showComments());
      this.addEventListeners();
    },
    
    initializeTemplates: function() {
      this.photoTemplate = Handlebars.compile($("#photos").html());
      this.photoInfoTemplate = Handlebars.compile($("#photo_information").html());
      this.commentsTemplate = Handlebars.compile($("script#comments").html());
      this.commentTemplate = Handlebars.compile($("script#comment").html());
      
      Handlebars.registerPartial("comment", $("script#comment").html());
    },
    
    getPhotos: function() {
      this.currentRequest = $.ajax({
        url: this.url + "/photos",
        method: "GET",
        dataType: "json",
      }).success(function(json) {
        gallery.photos = json;
        gallery.renderPhotos();
      });
    },
    
    renderPhotos: function() {
      $("#slides").append(this.photoTemplate({photos: gallery.photos}));
      this.showPhotoHeader();
    },
    
    showPhotoHeader: function() {
      var photo = this.photos.filter(function(photo) { return photo.id === gallery.id })[0];
      var $header = $("section > header");
      $header.children().remove();
      $header.append(this.photoInfoTemplate(photo));
    },
    
    updateLikes: function() {
      $.ajax({
        url: gallery.url + "/photos/like",
        data: {photo_id: '' + gallery.id},
        method: "POST",
        success: function(json) {
          gallery.photos = gallery.photos.map(function(photo) {
            if (photo.id === gallery.id) {
              photo.likes = json.total;
            }
            return photo;
          });
          gallery.showPhotoHeader();
        },
      })
    },
    
    updateFavorites: function() {
      $.ajax({
        url: gallery.url + "/photos/favorite",
        data: {photo_id: '' + gallery.id},
        method: "POST",
        success: function(json) {
          gallery.photos = gallery.photos.map(function(photo) {
            if (photo.id === gallery.id) {
              photo.favorites = json.total;
            }
            return photo;
          });
          gallery.showPhotoHeader();
        },
      })
    },
    
    showComments: function() {
      var id = this.id
      this.currentRequest = $.ajax({
        url: this.url + "/comments?photo_id=" + id,
        method: "GET",
        dataType: "json",
      });
      
      this.currentRequest.success(function(json) {
        gallery.comments = json;
        var $ul = $("#comments > ul")
        $ul.children().remove();
        $ul.append(gallery.commentsTemplate({comments: gallery.comments}));
      })
    },
    
    addNewComment: function(data) {
      $("#comments > ul").append(gallery.commentTemplate(data));
    },
    
    addEventListeners: function() {
      var $slides = $("#slides");
      
      $("a.prev").click(function(e) {
        e.preventDefault();
        
        var $currentFigure = $slides.find("figure:visible");
        var $prevFigure = $currentFigure.prev();
        
        if ($prevFigure.length === 0) { $prevFigure = $slides.children().last()};
        
        gallery.id = +$prevFigure.attr("data-id");
        
        $currentFigure.fadeOut(gallery.fadeSpeed);
        $prevFigure.fadeIn(gallery.fadeSpeed);
        
        gallery.showPhotoHeader();
        gallery.showComments();
      });
      
      $("a.next").click(function(e) {
        e.preventDefault();
        
        var $currentFigure = $slides.find("figure:visible");
        var $nextFigure = $currentFigure.next();
        
        if ($nextFigure.length === 0) { $nextFigure = $slides.children().first()};
        
        gallery.id = +$nextFigure.attr("data-id");
        
        $currentFigure.fadeOut(gallery.fadeSpeed);
        $nextFigure.fadeIn(gallery.fadeSpeed);
        
        gallery.showPhotoHeader();
        gallery.showComments();
      });
      
      $("section header").click(function(e) {
        e.preventDefault();
        var $a = $(e.target);
        
        if ($a.data("property") === "likes") {
          gallery.updateLikes();
        } else if ($a.data("property") === "favorites") {
          gallery.updateFavorites();
        }
      });
      
      $("#comments form").submit(function(e) {
        e.preventDefault();
        var $form = $(this);
        
        $("input[type=hidden]").val(gallery.id);
        
        $.ajax({
          url: gallery.url + "/comments/new",
          data: $form.serialize(),
          method: "POST",
          success: function(json) {
            gallery.addNewComment(json);
            $form.find("input[type=text], input[type=email], textarea").val("");
          }
        });
      });
    }
  }
})();

$(gallery.init.bind(gallery));