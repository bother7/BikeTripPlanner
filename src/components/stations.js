class Stations {
  constructor() {
    this.stations = []
    this.initBindingsAndEventListeners()
    this.adapter = new StationsAdapter()
    this.fetchAndLoadStations()
  }

  initBindingsAndEventListeners() {
    this.stationDiv = document.getElementById("stations-container")
  }

  fetchAndLoadStations() {
    this.adapter.getStations()
    .then( stationsJSON => stationsJSON.forEach( station => {
      this.stations.push( new Station(station) )
      var latLng = new google.maps.LatLng(station.lat,station.lon)
      var stationcircle = new google.maps.Circle({
         strokeColor: '#FF0000',
         strokeOpacity: 0.8,
         strokeWeight: 2,
         fillColor: '#FF0000',
         fillOpacity: 0.35,
         map: map,
         center: latLng,
         radius: 100
       });
       var infowindow = new google.maps.InfoWindow({
         content: `<div> ${station.name} ${station.trains}</div>`,
         position: latLng
      });
       stationcircle.addListener("click", function(){
         infowindow.open(map, stationcircle)
       })
    })).then(this.render.bind(this) ).catch( () => alert('The server does not appear to be running') )
  }

  stationsHTML() {
    return this.stations.map( station => station.render() ).join('')
  }

  render() {
    this.stationDiv.innerHTML = `<ul>${this.stationsHTML()}</ul>`
  }
}
