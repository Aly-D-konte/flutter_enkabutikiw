class ModelBoutiques {
  int id;
  final String nom;
  final String description;
  final String adresse;
  final String image;
  final bool etat;
  final User? user;

  ModelBoutiques(
         this.id,
         this.nom,
         this.description,
         this.adresse,
         this.image,
         this.etat,
         this.user, );

  factory ModelBoutiques.fromMap(Map json) {
    return ModelBoutiques(
      json['id'],
      json['nom'],
      json['description'],
      json['adresse'],
      json['image'],
      json['etat'],
      json['user'] != null ? new User.fromJson(json['user']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nom'] = this.nom;
    data['description'] = this.description;
    data['adresse'] = this.adresse;
    data['image'] = this.image;
    data['etat'] = this.etat;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? username;
  String? prenom;
  String? nom;
  String? telephone;
  String? adresse;
  String? genre;
  String? image;
  String? email;
  String? password;
  List<Roles>? roles;

  User(
      {this.id,
        this.username,
        this.prenom,
        this.nom,
        this.telephone,
        this.adresse,
        this.genre,
        this.image,
        this.email,
        this.password,
        this.roles});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    prenom = json['prenom'];
    nom = json['nom'];
    telephone = json['telephone'];
    adresse = json['adresse'];
    genre = json['genre'];
    image = json['image'];
    email = json['email'];
    password = json['password'];
    if (json['roles'] != null) {
      roles = <Roles>[];
      json['roles'].forEach((v) {
        roles!.add(new Roles.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['prenom'] = this.prenom;
    data['nom'] = this.nom;
    data['telephone'] = this.telephone;
    data['adresse'] = this.adresse;
    data['genre'] = this.genre;
    data['image'] = this.image;
    data['email'] = this.email;
    data['password'] = this.password;
    if (this.roles != null) {
      data['roles'] = this.roles!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Roles {
  int? id;
  String? name;

  Roles({this.id, this.name});

  Roles.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
