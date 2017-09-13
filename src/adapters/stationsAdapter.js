class StationsAdapter {
  constructor() {
    this.baseUrl = 'http://localhost:3000/api/v1/stations'
  }

  getStations() {
    return fetch(this.baseUrl).then(response => response.json())
  }
}
