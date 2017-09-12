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
    console.log(tripDeleteParams)
    return fetch(deleteUrl, tripDeleteParams).then(response => response.json())
  }

  createTrip(body) {
    const tripCreateParams = {
      method: 'POST',
      headers: {
        'Content-Type':'application/json'
      },
      body: JSON.stringify({body})
    }
    console.log(tripCreateParams)
    return fetch(this.baseUrl, tripCreateParams).then(resp => resp.json())
  }

}
