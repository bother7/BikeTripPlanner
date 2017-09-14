class Station {
  constructor(stationJSON) {
    this.id = stationJSON.id
    this.stop_id = stationJSON.stop_id
    this.name = stationJSON.name
    this.lat = stationJSON.lat
    this.lon = stationJSON.lon
    this.trains = stationJSON.trains
    this.line = stationJSON.line
  }

  render() {
    return `<li data-tripid='${this.stop_id}' data-props='${JSON.stringify(this)}' class='trip-element'>name - ${this.name}</li>`
  }
}
