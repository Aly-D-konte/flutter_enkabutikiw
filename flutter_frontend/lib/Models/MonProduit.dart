class ModelProduits {
  int? id;
  String? nom;
  String? description;
  String? marque;
  int? prix;
  String? modele;
  String? capacite;
  String? image;
  Null? quantiteDisponible;
  String? type;
  Categorie? categorie;
  User? user;
  List<Boutiques>? boutiques;

  ModelProduits(
      {this.id,
        this.nom,
        this.description,
        this.marque,
        this.prix,
        this.modele,
        this.capacite,
        this.image,
        this.quantiteDisponible,
        this.type,
        this.categorie,
        this.user,
        this.boutiques});

  ModelProduits.fromMap(Map json) {
    id = json['id'];
    nom = json['nom'];
    description = json['description'];
    marque = json['marque'];
    prix = json['prix'];
    modele = json['modele'];
    capacite = json['capacite'];
    image = json['image'];
    quantiteDisponible = json['quantite_disponible'];
    type = json['type'];
    categorie = json['categorie'] != null
        ? new Categorie.fromJson(json['categorie'])
        : null;
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    if (json['boutiques'] != null) {
      boutiques = <Boutiques>[];
      json['boutiques'].forEach((v) {
        boutiques!.add(new Boutiques.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nom'] = this.nom;
    data['description'] = this.description;
    data['marque'] = this.marque;
    data['prix'] = this.prix;
    data['modele'] = this.modele;
    data['capacite'] = this.capacite;
    data['image'] = this.image;
    data['quantite_disponible'] = this.quantiteDisponible;
    data['type'] = this.type;
    if (this.categorie != null) {
      data['categorie'] = this.categorie!.toJson();
    }
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.boutiques != null) {
      data['boutiques'] = this.boutiques!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Categorie {
  int? id;
  String? nom;
  String? image;

  Categorie({this.id, this.nom, this.image});

  Categorie.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nom = json['nom'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nom'] = this.nom;
    data['image'] = this.image;
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

class Boutiques {
  int? id;
  String? nom;
  String? description;
  String? adresse;
  String? image;
  bool? etat;
  User? user;

  Boutiques(
      {this.id,
        this.nom,
        this.description,
        this.adresse,
        this.image,
        this.etat,
        this.user});

  Boutiques.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nom = json['nom'];
    description = json['description'];
    adresse = json['adresse'];
    image = json['image'];
    etat = json['etat'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
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