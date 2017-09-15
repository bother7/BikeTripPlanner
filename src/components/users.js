class Users {
  constructor() {
    this.users = []
    this.initBindingsAndEventListeners()
    // this.fetchAndLoadUser()
  }

  initBindingsAndEventListeners() {
  //   this.loginForm = document.getElementById("simple-form");
  //   this.loginEmail = document.getElementById("user-input");
  //   this.loginForm.addEventListener("submit", (e) => {
  //     e.preventDefault();
  //     debugger;
  //     this.adapter.getUsers()
  //     .then( usersJSON => usersJSON.forEach( user => {
  //       new_user = new User(new_user)
  //       if (this.loginEmail.value === user["email"]) {
  //         this.users.push(new_user)
  //         return new_user
  //       }
  //   }))
  // })
}

  stationsHTML() {
    return this.stations.map( station => station.render() ).join('')
  }

  render() {
    this.stationDiv.innerHTML = `<ul>${this.stationsHTML()}</ul>`
  }
}
