class Trains {
  constructor() {
    this.trains = []
    this.initBindingsAndEventListeners()
    this.adapter = new TrainsAdapter()
    this.fetchAndLoadTrains()
  }

  initBindingsAndEventListeners() {
    this.trainDiv = document.getElementById("trains-container")
  }

  fetchAndLoadTrains() {
    this.adapter.getTrains()
    .then( trainsJSON => trainsJSON.forEach( train => {
      this.trains.push( new Train(train) )
      // var latLng = new google.maps.LatLng(station.lat,station.lon)
      // var marker = new google.maps.Marker({position: latLng,map: map, label: station.name})
      // marker.addListener("click", function(e) { alert(`${station.name}`) })
    })).then( this.render.bind(this) ).catch( () => alert('The server does not appear to be running') )
  }

  trainsHTML() {
    return this.trains.map( train => train.render() ).join('')
  }

  render() {
    this.trainDiv.innerHTML = `<ul>${this.trainsHTML()}</ul>`
  }
}
