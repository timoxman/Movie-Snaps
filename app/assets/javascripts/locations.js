var map;
var newMarker = [];
var allMarkers = [];
var result;

$(document).ready(function() {

  if ($('#locations').length) {

    $('#enterMovie').hide();
    $('#confirm-marker').hide();

    loadMap();
    autoCompleteGoogleMaps();
    getMarkers();

    $('#mapDestination').click(function(){
      $('#enterMovie').show('slow');
      $('#confirm-marker').show('slow');
    });

    $('#add-marker').click(function(){
      if ($('#enterDestination').val()) {
        $('#enterMovie').show('slow');
        $('#confirm-marker').show('slow');
      }
    });

    $('#submitDestination').click(function(){
      codeAddress();
    });

    $('#add-marker').click(function(){
      placeMarker(map.getCenter());
    });

    $('#confirm-marker').click(function(){
      confirmLocation(newMarker[0]);
    });
  }
});

function loadMap() {
  var myOptions2 = {
      zoom: 15,
      mapTypeId: google.maps.MapTypeId.ROADMAP,
      draggableCursor: 'crosshair'
  };
  if(navigator.geolocation) {
    map = new google.maps.Map(document.getElementById("mapDestination"), myOptions2);
    navigator.geolocation.getCurrentPosition(function(position) {
      var initialLocation = new google.maps.LatLng(position.coords.latitude,position.coords.longitude);
      map.setCenter(initialLocation);
    });
  } else { // Browser doesn't support Geolocation
    var latlng = new google.maps.LatLng(51.517307, -0.073403);
    map = new google.maps.Map(document.getElementById("mapDestination"), myOptions2);
    map.setCenter(latlng);
  }
  google.maps.event.addListener(map, 'click', function(event) {
    placeMarker(event.latLng);
  });
}

function autoCompleteGoogleMaps() {
  var input = document.getElementById('enterDestination');
  var autocomplete = new google.maps.places.Autocomplete(input);
  autocomplete.bindTo('bounds', map);
  google.maps.event.addListener(autocomplete, 'place_changed', function () {
    var place = autocomplete.getPlace();
  });
}

function getMarkers() {
  var url = '/locations/api'
  $.getJSON(url, function (data) {
    allMarkers = data
  })
  .done(function() {
    allMarkers.forEach(function(marker) {
      var coords = new google.maps.LatLng(marker.latitude, marker.longitude)
        new google.maps.Marker({
        position: coords,
        icon:'/images/clapper.png',
        animation: google.maps.Animation.DROP,
        map: map
      });
    });
  })
}

function getAddress() {
  var url = 'https://maps.googleapis.com/maps/api/geocode/json?latlng='
  var lat = newMarker[0].position.A
  var lng = newMarker[0].position.F
  $.getJSON(url + lat + "," + lng + '&sensor=true', function (data) {
    result = data.results[0].formatted_address;
    document.getElementById("enterDestination").value = result;
  });
}

function codeAddress() {
  var geocoder = new google.maps.Geocoder();
  var sAddress = document.getElementById("enterDestination").value;
  geocoder.geocode( { 'address': sAddress}, function(results, status) {
    if (status == google.maps.GeocoderStatus.OK) {
      map.setCenter(results[0].geometry.location);
      var marker = new google.maps.Marker({
          map: map,
          position: results[0].geometry.location
      });
    } else {
      alert("Geocode failed for the following reason: " + status);
    }
  });
}

function removeMarker() {
  marker = newMarker.pop();
  marker.setMap(null);
};

function placeMarker(location) {
  if(newMarker.length > 0) {
    removeMarker();
  }
  var marker = new google.maps.Marker({
    position: location,
    icon:'/images/clapper.png',
    animation: google.maps.Animation.DROP,
    map: map
  });
  var infowindow = new google.maps.InfoWindow({
    content: 'Add your movie scene here ',
    maxWidth: 200
  });
  infowindow.open(map,marker);
  newMarker.push(marker)
  getAddress();
  google.maps.event.addListener(marker, 'click', function() {
    infowindow.open(map,marker);
  });
  google.maps.event.addListener(marker, 'mouseover', function() {
    this.setAnimation(google.maps.Animation.BOUNCE);
  });
  google.maps.event.addListener(marker, 'mouseout', function() {
    this.setAnimation(null);
  });
}

function removeMarker() {
  marker = newMarker.pop();
  marker.setMap(null);
}

function confirmLocation(marker) {
  var film = document.getElementById('enterMovie').value;
  if (newMarker.length != 0) {
    window.open("/locations/new?posa=" + marker.position.A + "&posf=" + marker.position.F + "&address=" + result + "&film=" + film, "_self")
  } else {
    document.getElementById("notify").innerHTML = 'Click on the map to add a marker'
  }
}

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
