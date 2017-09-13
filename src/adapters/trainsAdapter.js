class TrainsAdapter {
  constructor() {
    this.baseUrl = 'http://localhost:3000/api/v1/trains'
  }

  getTrains() {
    return fetch(this.baseUrl).then(response => response.json())
  }
}
