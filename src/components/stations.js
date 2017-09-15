class Stations {
  constructor() {
    this.stations = []
    this.initBindingsAndEventListeners()
    this.adapter = new StationsAdapter()
    this.fetchAndLoadStations()
    this.circles = []
  }

  initBindingsAndEventListeners() {
    this.stationDiv = document.getElementById("stations-container")
    this.circleSelect = document.getElementById("train-line")
    this.circleSelect.addEventListener("change", this.stationCircles.bind(this))
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
         radius: 100,
         info: station.line
       });
       var infowindow = new google.maps.InfoWindow({
         content: `<div> ${station.name}</div>`,
         position: latLng
      });
       stationcircle.addListener("click", function(){
         infowindow.open(map, stationcircle)
       })
       this.circles.push(stationcircle)
    })).then(this.render.bind(this) ).catch( () => alert('The server does not appear to be running') )
  }

  stationsHTML() {
    return this.stations.map( station => station.render() ).join('')
  }

  render() {
    this.stationDiv.innerHTML = `<ul>${this.stationsHTML()}</ul>`
  }

  stationCircles(){
    if (event.target.value === "default") {
      this.circles.forEach(circle => circle.setMap(map))
    }
    else {
      this.circles.forEach((circle)=>{
        if (circle.info !== null && circle.info.includes(event.target.value)){
          circle.setMap(map)
        }
        else {
          circle.setMap(null)
        }
      })
    }

  }
}
