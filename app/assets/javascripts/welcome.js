$(document).ready(function() {

  var photos;

  $('.likes-link').on('click', function(event){
    event.preventDefault();
    $(this).fadeOut(1000);
    var likeCount = $(this).next('.likes_count');

    $.post(this.href, function(response){
      likeCount.text(response.new_like_count);
    });
  });

  var url = '/welcome/api'
  $.getJSON(url, function (data) {
    photos = data
  })
    .done(function() {

    });

  $('#slides').on('click', function() {
    $('#slides').append("<img src=" + photos[0].image_file_name + "/>")
  });
});

