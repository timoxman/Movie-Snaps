$(document).ready(function() {

  var movieTitleYear = $('#movie_name').text();
  var movieTitle = movieExtractTitle(movieTitleYear);
  var movieYear = movieExtractYear(movieTitleYear);
  getPoster(movieTitle, movieYear);

});

function movieExtractTitle(movieTitleYear){
  return movieTitleYear.replace(/ \([0-9]{4}\)$/, '').replace(/ /g, '+').toLowerCase();
}

function movieExtractYear(movieTitleYear){
  return movieTitleYear.replace(/([0-9a-zA-Z ()\D]*)([0-9]{4})\)$/, '$2');
}

function getPoster(movieTitle, movieYear) {
  var url = 'https://www.omdbapi.com/?t=' + movieTitle + '&y=' + movieYear;
  var poster;
  $.getJSON(url, function(data) {
    poster = '<img src="' + data['Poster'] + '" title="' + movieTitle + movieYear + '"/>';
  })
  .done(function() {
    $('#movie_img').html(poster);
  })
}

$(function() {
  document.getElementById("preview").style.maxHeight = "10px";

  $('#visit_photo_image').on('change', function(event) {
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
    console.log(files);
  });
});