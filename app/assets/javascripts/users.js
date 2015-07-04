$(document).ready(function() {

  $('#visits').children('ul').children('li').each(function(index) {
    $(this).find('.movieTitleYear').hide();
    $(this).find('.longitude').hide();
    $(this).find('.latitude').hide();

    var movieTitleYear = $(this).find('.movieTitleYear').text();
    var movieTitle = movieExtractTitle(movieTitleYear);
    var movieYear = movieExtractYear(movieTitleYear);
    console.log(movieTitle);
    console.log(movieYear);
    getPoster(movieTitle, movieYear, index);

    var longitude = $(this).find('.longitude').text();
    var latitude = $(this).find('.latitude').text();
    var mapDivId = $(this).find('.mapDestination').attr('id');
    loadMap(latitude, longitude, mapDivId);
  });

});

function movieExtractTitle(movieTitleYear){
  return movieTitleYear.replace(/ \([0-9]{4}\)$/, '').replace(/ /g, '+').toLowerCase();
}

function movieExtractYear(movieTitleYear){
  return movieTitleYear.replace(/([0-9a-zA-Z ()\D]*)([0-9]{4})\)$/, '$2');
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

function loadMap(latitude, longitude, mapDivId) {
  var myOptions2 = {
      zoom: 15,
      mapTypeId: google.maps.MapTypeId.ROADMAP
  };

  var latlng = new google.maps.LatLng(latitude, longitude);
  map = new google.maps.Map(document.getElementById(mapDivId), myOptions2);
  map.setCenter(latlng);
  map.setOptions({ draggableCursor: 'crosshair' });
  placeMarker(map.getCenter());
};

function placeMarker(location) {
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