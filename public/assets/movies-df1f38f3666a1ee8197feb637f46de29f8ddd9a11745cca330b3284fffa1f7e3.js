$(document).ready(function() {

  var movieTitleYear = $('#title').text();
  var movieTitle = movieExtractTitle(movieTitleYear);
  var movieYear = movieExtractYear(movieTitleYear);
  getPoster(movieTitle, movieYear);

  $('#scenes').children('ul').children('li').each(function(index) {
    $(this).find('.longitude').hide();
    $(this).find('.latitude').hide();
    var longitude = $(this).find('.longitude').text();
    var latitude = $(this).find('.latitude').text();
    var mapDivId = $(this).find('.mapDestination').attr('id');
    loadMap(latitude, longitude, mapDivId);
  });

  $('.comment-form').hide();

  $('.comment-link').click(function() {
    $('.comment-link').show(1000);
    $(this).hide(1000);
    $('.comment-form').hide(1000);
    $(this).next('.comment-form').slideToggle(1000);
  })

  $('.likes-link').on('click', function(event){
    event.preventDefault();
    $(this).fadeOut(1000);
    var likeCount = $(this).next('.likes_count');

    $.post(this.href, function(response){
      likeCount.text(response.new_like_count);
    });
  });

  $("#noResultsMsg").hide();

  $('#select-movie').click(function(){
    selectMovie();
  });

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

function acquireMovies() {
  $("#noResultsMsg").fadeOut(500);
  var url = '/movies/api'
  var movieValue = document.getElementById("enterMovie").value
  $.getJSON(url, function (data) {
    var movieArray = data;
    var availableMovies = [];

    if(movieArray) {
      movieArray.forEach(function(movie) {
        availableMovies.push(movie['name']);
      });

      $("#enterMovie").autocomplete({
        source: availableMovies
      });
    }
  })
}

function selectMovie() {
  var url = '/movies/api'
  var movieValue = document.getElementById('enterMovie').value
  $.getJSON(url, function (data) {
    var movieArray = data;
    var matches = []
    if(movieArray) {
      movieArray.forEach(function(movie) {
        if(movie['name'] === movieValue) {
          window.open('/movies/' + movie['id'],'_self')
          matches.push('1');
        };
      });
    }
    if(matches.length === 0) {
      $("#noResultsMsg").fadeIn(500);
    }
  });
}
