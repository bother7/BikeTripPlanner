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
      var marker = new google.maps.Marker({position: latLng,map: map})//, label: station.name
      // marker.addListener("click", function(e) { alert(`${station.name}`) })
    })).then( this.render.bind(this) ).catch( () => alert('The server does not appear to be running') )
  }

  stationsHTML() {
    return this.stations.map( station => station.render() ).join('')
  }

  render() {
    this.stationDiv.innerHTML = `<ul>${this.stationsHTML()}</ul>`
  }
}
