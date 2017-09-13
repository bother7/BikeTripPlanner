class Station {
  constructor(stationJSON) {
    this.stop_id = stationJSON.stop_id
    this.name = stationJSON.name
    this.lat = stationJSON.lat
    this.lon = stationJSON.lon
  }

  render() {
    return `<li data-tripid='${this.stop_id}' data-props='${JSON.stringify(this)}' class='trip-element'>name - ${this.name}</li>`
  }
}
