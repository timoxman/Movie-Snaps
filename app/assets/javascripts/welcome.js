$(document).ready(function() {

  $('.likes-link').on('click', function(event){
    event.preventDefault();
    $(this).fadeOut(1000);
    var likeCount = $(this).next('.likes_count');

    $.post(this.href, function(response){
      likeCount.text(response.new_like_count);
    });
  });

  $('.carousel').carousel({
    interval: 2000
  })

});
