class Trips {
  constructor() {
    this.trips = []
    this.initBindingsAndEventListeners()
    this.adapter = new TripsAdapter()
    this.fetchAndLoadTrips()
  }

  initBindingsAndEventListeners() {
    this.tripsForm = document.getElementById('new-trip-form')
    this.tripInput = document.getElementById('new-trip-body')
    this.tripsNode = document.getElementById('trips-container')
    this.tripsForm.addEventListener('submit',this.handleAddTrip.bind(this))
    this.tripsNode.addEventListener('click',this.handleDeleteTrip.bind(this))
  }

  fetchAndLoadTrips() {
    this.adapter.getTrips()
    .then( tripsJSON => tripsJSON.forEach( trip => this.trips.push( new Trip(trip) )))
      .then( this.render.bind(this) )
      .catch( () => alert('The server does not appear to be running') )
  }

  handleAddTrip() {
    event.preventDefault()
    const body = this.tripInput.value
    this.adapter.createTrip(origin, destination)
    .then( (tripJSON) => this.trips.push(new Trip(tripJSON)) )
    .then(  this.render.bind(this) )
    .then( () => this.tripInput.value = '' )
  }

  handleDeleteTrip() {
    if (event.target.dataset.action === 'delete-trip' && event.target.parentElement.classList.contains("trip-element")) {
      const tripId = event.target.parentElement.dataset.tripid
      this.adapter.deleteTrip(tripId)
      .then( resp => this.removeDeletedTrip(resp) )
    }
  }

  removeDeletedTrip(deleteResponse) {
    this.trips = this.trips.filter( trip => trip.id !== deleteResponse.tripId )
    this.render()
  }

  tripsHTML() {
    return this.trips.map( trip => trip.render() ).join('')
  }

  render() {
    this.tripsNode.innerHTML = `<ul>${this.tripsHTML()}</ul>`
  }
}
