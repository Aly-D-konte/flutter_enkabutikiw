class Users {
  final int id;
  final String username;
  final String password;
  final String nom;
  final String prenom;
  final String email;

  Users(
      this.id, this.username, this.password, this.nom, this.prenom, this.email);

  factory Users.fromMap(Map jsonU) {
    return Users(jsonU['id'], jsonU['username'], jsonU['password'],
        jsonU['nom'], jsonU['prenom'], jsonU['email']);
  }
}
