class App {
  constructor() {
    this.stations = new Stations()
    this.trains = new Trains()
    this.userAdapter = new UsersAdapter()
    this.handleUserLogin()
  }

  handleUserLogin() {
    this.loginForm = document.getElementById("simple-form");
    this.loginEmail = document.getElementById("user-input");
    this.loginForm.addEventListener("submit", (e) => {
      e.preventDefault();
      this.userAdapter.getUsers(this.loginEmail.value).then(userJson => {
        // debugger
        this.user = new User(userJson)
        this.loginForm.innerHTML = `Welcome: ${this.user.email}`
      })
  })
  }
}

/*
// for MVP quick user signin
app init, we ask user to sign in
fetch() to API, find_or_create_by our user, and return that obj
return api data & new User()
we create new JS user obj
when that finishes, we store user properties on JS obj
*/
