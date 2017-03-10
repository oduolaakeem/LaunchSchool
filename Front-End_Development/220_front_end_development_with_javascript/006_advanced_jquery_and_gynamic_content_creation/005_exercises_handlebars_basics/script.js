// script.js

$(function() {
  var posts = [];
  
  var post1 = {
    title: 'Lorem ipsum dolor sit amet',
    published: 'April 1, 2015',
    body: '<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit.</p>',
    tags: ["Lorem", "ipsum", "post", "internet"],
  };
  
  var post2 = {
    title: 'amet ipsum Loret disorder',
    published: 'February 6, 2017',
    body: '<p>This is the second post!</p>',
  };
  
  posts.push(post1, post2);
  
  var postTemplate = Handlebars.compile($("#posts").html());
  var postTagsTemplate = Handlebars.compile($("#tag").html());
  
  Handlebars.registerPartial("tag", $("#tag").html());
  console.log(postTemplate);
  
  $("body").append(postTemplate({ posts: posts}));
})