class Train {
  constructor(trainJSON) {
    this.id = trainJSON.id
    this.trip_id = trainJSON.trip_id
    this.route = trainJSON.route
    this.direction = trainJSON.direction
    this.delay = trainJSON.delay
    this.currentlocation = trainJSON.currentlocation
    this.history = trainJSON.history
  }

  render() {
    return `<li data-tripid='${this.trip_id}' data-props='${JSON.stringify(this)}' class='trip-element'>ID: ${this.id} Train Number: ${this.trip_id} route: ${this.route} ${this.currentlocation}</li>`
  }

}
