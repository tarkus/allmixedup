class User extends Spine.Model
  @configure "User", "name", "email", "password"
  @extend Spine.Model.Ajax

  @url: "/users"
  
@app.exports["model user"] = User

