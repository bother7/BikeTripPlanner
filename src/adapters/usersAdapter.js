class UsersAdapter {
  constructor() {
    this.baseUrl = 'http://localhost:3000/api/v1/users'
  }

  getUsers(body) {
    // return fetch(this.baseUrl).then(response => response.json())
    const  userParams = {
      method: 'POST',
      headers: {
        "Content-Type": "application/json"
      },
      body: JSON.stringify({body})
    }
    return fetch(this.baseUrl, userParams).then(response => response.json())
  }
}
