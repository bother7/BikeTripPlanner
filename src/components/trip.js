class Trip {
  constructor(tripJSON) {
    this.origin = tripJSON.origin
    this.destination = tripJSON.destination
    this.id = tripJSON.id
  }

  render() {
    return `<li data-tripid='${this.id}' data-props='${JSON.stringify(this)}' class='trip-element'>origin - ${this.origin} destination - ${this.destination}<button data-action='delete-trip'>X</button></li>`
  }
}
