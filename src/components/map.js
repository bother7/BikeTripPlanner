var map;
function initMap() {

    map = new google.maps.Map(document.getElementById('map'), {
      zoom: 13,
      center: new google.maps.LatLng(40.7185869,-73.9950647),
      mapTypeId: 'terrain'
    });
    var transitLayer = new google.maps.TransitLayer();
    transitLayer.setMap(map);
}
