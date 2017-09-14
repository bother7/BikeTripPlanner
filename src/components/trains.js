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
      if (train.currentlocation !== "inactive") {
        let array = train.currentlocation.split(",")
        var image = {
          url: 'https://www.ptv.vic.gov.au/themes/transport-site/images/jp/icons/iconTrain.png',
          size: new google.maps.Size(36, 36),
          origin: new google.maps.Point(0, 0),
          anchor: new google.maps.Point(18, 18)
        }

        var latLng = new google.maps.LatLng(array[0],array[1])
         var marker = new google.maps.Marker({
           position: latLng,
           map: map,
           icon: image
         })
         var infowindow = new google.maps.InfoWindow({
           content: `<div> ${train.route} Train - ${train.direction}</div>`,
           position: latLng
        });
         marker.addListener("click", function(){
           infowindow.open(map, marker)
         })
       }
    })).then( this.render.bind(this) ).catch( () => alert('The server does not appear to be running') )
  }

  trainsHTML() {
    return this.trains.map( train => train.render() ).join('')
  }

  render() {
    this.trainDiv.innerHTML = `<ul>${this.trainsHTML()}</ul>`
  }
}
