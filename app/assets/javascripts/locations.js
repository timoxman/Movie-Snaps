// var map;
// var newMarker = [];
// var allMarkers = [];
// var result;

$(document).ready(function() {
  $(this).find('#longitude').hide();
  $(this).find('#latitude').hide();
  var longitude = $(this).find('#longitude').text();
  var latitude = $(this).find('#latitude').text();
  loadMapProfile(latitude, longitude);

  $('#scenes').children('ul').children('li').each(function(index) {
    $(this).find('.movieTitleYear').hide();
    var movieTitleYear = $(this).find('.movieTitleYear').text();
    var movieTitle = movieExtractTitle(movieTitleYear);
    var movieYear = movieExtractYear(movieTitleYear);
    getPoster(movieTitle, movieYear, index);
  });

  // loadMap();
  // autoCompleteGoogleMaps();
  // getMarkers();

  // $('#submitDestination').click(function(){
  //   codeAddress();
  // });

  // $('#add-marker').click(function(){
  //   placeMarker(map.getCenter());
  // });

  // $('#confirm-marker').click(function(){
  //   confirmLocation(newMarker[0]);
  // });
});

// function loadMap() {
//   var browserSupportFlag =  new Boolean();
//   var initialLocation;
//   var myOptions2 = {
//       zoom: 15,
//       mapTypeId: google.maps.MapTypeId.ROADMAP
//   };

//   if(navigator.geolocation) {
//     map = new google.maps.Map(document.getElementById("mapDestination"), myOptions2);
//     browserSupportFlag = true;
//     navigator.geolocation.getCurrentPosition(function(position) {
//       initialLocation = new google.maps.LatLng(position.coords.latitude,position.coords.longitude);
//       map.setCenter(initialLocation);
//     });
//   }
//   // Browser doesn't support Geolocation
//   else {
//     var latlng = new google.maps.LatLng(51.517307, -0.073403);
//     map = new google.maps.Map(document.getElementById("mapDestination"), myOptions2);
//     map.setCenter(latlng);
//   }
//   map.setOptions({ draggableCursor: 'crosshair' });
//   google.maps.event.addListener(map, 'click', function(event) {
//     placeMarker(event.latLng);
//   });
// }

// function autoCompleteGoogleMaps() {
//   var input = document.getElementById('enterDestination');
//   var autocomplete = new google.maps.places.Autocomplete(input);
//   autocomplete.bindTo('bounds', map);
//   google.maps.event.addListener(autocomplete, 'place_changed', function () {
//     var place = autocomplete.getPlace();
//   });
// }

// function getMarkers() {
//   var url = '/locations/api'
//   $.getJSON(url, function (data) {
//     allMarkers = data
//   })
//   .done(function() {
//     allMarkers.forEach(function(marker) {
//       var coords = new google.maps.LatLng(marker.latitude, marker.longitude)
//         new google.maps.Marker({
//         position: coords,
//         icon:'/images/clapper.png',
//         animation: google.maps.Animation.DROP,
//         map: map
//       });
//     });
//   })
// }

// function getAddress() {
//   var url = 'https://maps.googleapis.com/maps/api/geocode/json?latlng='
//   var lat = newMarker[0].position.A
//   var lng = newMarker[0].position.F
//   $.getJSON(url + lat + "," + lng + '&sensor=true', function (data) {
//     result = data.results[0].formatted_address;
//     document.getElementById("enterDestination").value = result;
//   });
// }

// function codeAddress() {
//   var geocoder = new google.maps.Geocoder();
//   var sAddress = document.getElementById("enterDestination").value;
//   geocoder.geocode( { 'address': sAddress}, function(results, status) {
//     if (status == google.maps.GeocoderStatus.OK) {
//       map.setCenter(results[0].geometry.location);
//       var marker = new google.maps.Marker({
//           map: map,
//           position: results[0].geometry.location
//       });
//     } else {
//       alert("Geocode failed for the following reason: " + status);
//     }
//   });
// }

// function removeMarker() {
//   marker = newMarker.pop();
//   marker.setMap(null);
// };

// function placeMarker(location) {
//   if(newMarker.length > 0) {
//     removeMarker();
//   }
//   var marker = new google.maps.Marker({
//     position: location,
//     icon:'/images/clapper.png',
//     animation: google.maps.Animation.DROP,
//     map: map
//   });
//   var infowindow = new google.maps.InfoWindow({
//     content: 'This movie scene was shot here ',
//     maxWidth: 200
//   });
//   infowindow.open(map,marker);
//   newMarker.push(marker)
//   getAddress();
//   google.maps.event.addListener(marker, 'click', function() {
//     infowindow.open(map,marker);
//   });
//   google.maps.event.addListener(marker, 'mouseover', function() {
//     this.setAnimation(google.maps.Animation.BOUNCE);
//   });
//   google.maps.event.addListener(marker, 'mouseout', function() {
//     this.setAnimation(null);
//   });
// }

// function removeMarker() {
//   marker = newMarker.pop();
//   marker.setMap(null);
// }

// function confirmLocation(marker) {
//   var film = document.getElementById('enterMovie').value;
//   if (newMarker.length != 0) {
//     window.open("/locations/new?posa=" + marker.position.A + "&posf=" + marker.position.F + "&address=" + result + "&film=" + film, "_self")
//   } else {
//     document.getElementById("notify").innerHTML = 'Click on the map to add a marker'
//   }
// }

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

// function acquireMovies() {
//   var url = 'https://www.omdbapi.com/?s='
//   var movieValue = document.getElementById("enterMovie").value
//   $.getJSON(url + movieValue + '*', function (data) {
//     var movieArray = data['Search'];
//     var availableMovies = [];

//     if (movieArray) {
//       movieArray.forEach(function(movie) {
//         availableMovies.push(movie['Title'] + ' (' + movie['Year'] + ')');
//       });

//       $("#enterMovie").autocomplete({
//         source: availableMovies
//       });
//     }
//   });
// }

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
    var listItem = $('#scenes').children('ul').children('li')[index];
    $(listItem).find('.moviePosterBox').html(poster);
  })
}