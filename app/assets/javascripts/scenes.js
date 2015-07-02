// $(document).ready(function() {
//   console.log('hello')
//   var formURL = '/movies';
//   var form = $('<form action="' + formURL + '" method="post">' +
//     '<input id="enterMovie" placeholder="Enter a movie" type="text" size="40" onkeydown="acquireMovies()"/>' +
//     '<input id="btnSubmit" type="submit" value="Add movie" onclick="addMovie()">' + '</form>');
//   console.log(form)
//   $('#add-movie').append(form);
//   form.submit()

// });

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