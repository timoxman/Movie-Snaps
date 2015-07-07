$(document).ready(function() {

  $('.likes-link').on('click', function(event){

    $(this).hide(1000);
    var likeCount = $(this).next('.likes_count');

    $.post(this.href, function(response){
      likeCount.text(response.new_like_count);
    })
  })
})
