class Users {
  final int id;
  final String username;
  final String password;

  Users(this.id, this.username, this.password);

  factory Users.fromMap(Map jsonU) {
    return Users(
        jsonU['id'],
        jsonU['username'],
        jsonU['password']
    );
  }
}