var geocoder;
var map;
var newMarker = [];
var allMarkers = [];
var result;
var browserSupportFlag =  new Boolean();
var initialLocation;
var test;

function initialize() {
  var myOptions2 = {
      zoom: 15,
      mapTypeId: google.maps.MapTypeId.ROADMAP
  };

  if(navigator.geolocation) {
    map = new google.maps.Map(document.getElementById("mapDestination"), myOptions2);
    browserSupportFlag = true;
    navigator.geolocation.getCurrentPosition(function(position) {
      initialLocation = new google.maps.LatLng(position.coords.latitude,position.coords.longitude);
      map.setCenter(initialLocation);
    });
  }
  // Browser doesn't support Geolocation
  else {
    var latlng = new google.maps.LatLng(51.517307, -0.073403);
    map = new google.maps.Map(document.getElementById("mapDestination"), myOptions2);
    map.setCenter(latlng);
    map.setOptions({ draggableCursor: 'crosshair' });
  }
    google.maps.event.addListener(map, 'click', function(event) {
      placeMarker(event.latLng);
    });
    var input = document.getElementById('enterDestination');
    var autocomplete = new google.maps.places.Autocomplete(input);
    autocomplete.bindTo('bounds', map);

    google.maps.event.addListener(autocomplete, 'place_changed', function () {
      var place = autocomplete.getPlace();
    });
    getMarkers();
}

function getMarkers() {
  var url = '/locations/api'
  $.getJSON(url, function (data) {
    allMarkers = data
    console.log(allMarkers)
  })
    .done(function() {
      allMarkers.forEach(function(marker) {
        console.log(marker)
        var coords = new google.maps.LatLng(marker.latitude, marker.longitude)
          new google.maps.Marker({
          position: coords,
          icon:'http://www.piercingpurpose.com/files/clapper.png',
          animation: google.maps.Animation.DROP,
          map: map
        });
      });
    })
}

function getAddress() {
  var url = 'http://maps.googleapis.com/maps/api/geocode/json?latlng='
  var lat = newMarker[0].position.A
  var lng = newMarker[0].position.F
  $.getJSON(url + lat + "," + lng + '&sensor=true', function (data) {
    result = data.results[0].formatted_address;
    document.getElementById("enterDestination").value = result;
  });
}

function codeAddress() {
  geocoder = new google.maps.Geocoder();
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
    icon:'http://www.piercingpurpose.com/files/clapper.png',
    animation: google.maps.Animation.DROP,
    map: map
  });
  var infowindow = new google.maps.InfoWindow({
    content: 'This move scene was shot here ' +
    '<img src="http://www.flickeringmyth.com/wp-content/uploads/2015/04/James-Bond.jpeg">Longitude: ',
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
  if (newMarker.length != 0) {
    window.open("/locations/new?posa=" + marker.position.A + "&posf=" + marker.position.F + "&address=" + result, "_self")
  } else {
    document.getElementById("notify").innerHTML = 'Click on the map to add a marker'
  }
}
