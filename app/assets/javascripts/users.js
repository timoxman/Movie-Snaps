$(document).ready(function() {
  $('#visits').children('ul').children('li').each(function(index) {
    $(this).find('.movieTitleYear').hide();
    $(this).find('.longitude').hide();
    $(this).find('.latitude').hide();
    var movieTitleYear = $(this).find('.movieTitleYear').text();
    var longitude = $(this).find('.longitude').text();
    var latitude = $(this).find('.latitude').text();
    var movieTitle = movieExtractTitle(movieTitleYear);
    var movieYear = movieExtractYear(movieTitleYear);
    var posterUrl = getPoster(movieTitle, movieYear, index);
  });
});

function movieExtractTitle(movieTitleYear){
  return movieTitleYear.replace(/ \([0-9]{4}\)$/, '').replace(/ /g, '+').toLowerCase();
}

function movieExtractYear(movieTitleYear){
  return movieTitleYear.replace(/([0-9a-zA-Z ()]*)([0-9]{4})\)$/, '$2');
}

function getPoster(movieTitle, movieYear, index) {
  var url = 'https://www.omdbapi.com/?t=' + movieTitle + '&y=' + movieYear;
  var poster;
  $.getJSON(url, function(data) {
    poster = '<img src=' + data['Poster'] + '/>';
  })
  .done(function() {
    var listItem = $('#visits').children('ul').children('li')[index];
    $(listItem).append(poster);
  })
}