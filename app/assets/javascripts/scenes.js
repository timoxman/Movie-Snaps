$(document).ready(function() {

  $(".locations.show").ready(function() {
    $(this).find('#longitude').hide();
    $(this).find('#latitude').hide();
    var longitude = $(this).find('#longitude').text();
    var latitude = $(this).find('#latitude').text();
    loadMapProfile(latitude, longitude);
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

function loadMapProfile(latitude, longitude) {
  var myOptions2 = {
      zoom: 15,
      mapTypeId: google.maps.MapTypeId.ROADMAP
  };

  var latlng = new google.maps.LatLng(latitude, longitude);
  map = new google.maps.Map(document.getElementById("mapDestination"), myOptions2);
  map.setCenter(latlng);
  map.setOptions({ draggableCursor: 'crosshair' });
  placeMarkerProfile(map.getCenter());
};

function placeMarkerProfile(location) {
  var marker = new google.maps.Marker({
    position: location,
    icon:'/images/clapper.png',
    animation: google.maps.Animation.DROP,
    map: map
  });
  google.maps.event.addListener(marker, 'mouseover', function() {
    this.setAnimation(google.maps.Animation.BOUNCE);
  });
  google.maps.event.addListener(marker, 'mouseout', function() {
    this.setAnimation(null);
  });
}