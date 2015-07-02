$(document).ready(function() {
  $("#btnSubmit").click(function () {
    var film = $('#enterMovie').val()
    if (film) {
      window.open("/movies/new?name=" + film, "_self")
    } else {
      $('body').append("Please enter a film")
    }
  });
});

function addMovie() {
  var film = $('#enterMovie').val()
  var location = $('#location').text()
  if (film) {
    window.open("/movies/new?name=" + film + "&location=" + location, "_self")
  } else {
    $('body').append("Please enter a film")
  }
};

function acquireMovies() {
  var url = 'https://www.omdbapi.com/?s='
  var movieValue = document.getElementById("enterMovie").value
  $.getJSON(url + movieValue + '*', function (data) {
    var movieArray = data['Search'];
    var availableMovies = [];

    if (movieArray) {
      movieArray.forEach(function(movie) {
        availableMovies.push(movie['Title'] + ' (' + movie['Year'] + ')');
      });

      $("#enterMovie").autocomplete({
        source: availableMovies
      });
    }
  });
}