$(document).ready(function() {

  if ($('#locations').length) {
    $('#selectDBLocation').click(function(){
      selectDBLocation();
    });
  }

  if ($('#locationShow').length) {
    $(".locations.show").ready(function() {
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
  }

});

function acquireDBLocations() {
  $("#noResultsMsg").fadeOut(500);
  var url = '/locations/api'
  var locationDBValue = document.getElementById("enterDBLocation").value
  $.getJSON(url, function (data) {
    var DBlocationArray = data;
    var availableDBLocations = [];

    if(DBlocationArray) {
      DBlocationArray.forEach(function(DBlocation) {
        availableDBLocations.push(DBlocation['address']);
      });

      $("#enterDBLocation").autocomplete({
        source: availableDBLocations
      });
    }
  })
}

function selectDBLocation() {
  var url = '/locations/api'
  var DBlocationValue = document.getElementById('enterDBLocation').value
  $.getJSON(url, function (data) {
    var DBlocationArray = data;
    var matches = []
    if(DBlocationArray) {
      DBlocationArray.forEach(function(DBlocation) {
        if(DBlocation['address'] === DBlocationValue) {
          window.open('/locations/' + DBlocation['id'],'_self')
          matches.push('1');
        };
      });
    }
    if(matches.length === 0) {
      $("#noResultsMsg").fadeIn(500);
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