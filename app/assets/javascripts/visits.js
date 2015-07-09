$(function() {

  $('#visit_photo_image').on('change', function(event) {
    $('#preview').hide();
    var files = event.target.files;
    var image = files[0]
    var reader = new FileReader();
    reader.onload = function(file) {
      var img = new Image();
      console.log(file);
      img.src = file.target.result;
      $('#preview').html(img);
    }
    reader.readAsDataURL(image);
    $('#preview').fadeIn(1000);
  });
});