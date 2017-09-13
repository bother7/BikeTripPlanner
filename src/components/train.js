class Train {
  constructor(trainJSON) {
    this.trip_id = trainJSON.trip_id
    this.route = trainJSON.route
    this.direction = trainJSON.direction
    this.delay = trainJSON.delay
  }

  render() {
    return `<li data-tripid='${this.trip_id}' data-props='${JSON.stringify(this)}' class='trip-element'>Train Number: ${this.trip_id} route: ${this.route} ${this.stations}</li>`
  }

}
