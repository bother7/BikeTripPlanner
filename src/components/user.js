class User {
  constructor(userJSON) {
    this.id = userJSON.id
    this.email = userJSON.email
    this.station = userJSON.station_id
  }
}
