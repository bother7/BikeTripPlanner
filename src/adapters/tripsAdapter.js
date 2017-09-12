class TripsAdapter {
  constructor() {
    this.baseUrl = 'http://localhost:3000/api/v1/trips'
  }

  getTrips() {
    return fetch(this.baseUrl).then(response => response.json())
  }

  deleteTrip(tripId) {
    const deleteUrl = `${this.baseUrl}/${tripId}`
    const tripDeleteParams = {
      method: 'DELETE',
      headers: {
        'Content-Type':'application/json'
      }
    }
    return fetch(deleteUrl, tripDeleteParams).then(response => response.json())
  }

  createTrip(origin, destination) {
    const tripCreateParams = {
      method: 'POST',
      headers: {
        'Content-Type':'application/json'
      },
      origin: JSON.stringify({origin}),
      destination: JSON.stringify({destination})

    }
    return fetch(this.baseUrl, tripCreateParams).then(resp => resp.json())
  }

}
