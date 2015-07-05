$(document).ready(function() {

  $('.comment-form').hide();

  $('.comment-link').click(function() {
    $(this).next().show('slow');
  })

  $('.likes-link').on('click', function(event){
    event.preventDefault();
    $(this).hide();
    var likeCount = $(this).next('.likes_count');

    $.post(this.href, function(response){
      likeCount.text(response.new_like_count);
    })
  })
})