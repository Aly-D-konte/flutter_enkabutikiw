import 'package:flutter_frontend/Models/ModelCategorie.dart';
import 'package:flutter_frontend/Models/boutique.dart';

class ModelProduit {
  final int id;
  final String? nom;
  final String? description;
  final String? marque;
  final int? prix;
  final String? modele;
  final String? capacite;
  final String? image;
  final int? quantiteDisponible;
  final String? type;
  final ModelCategorie? modelCategorie;
  //final int? user;
  //final int? boutiqueid;

  ModelProduit(
    this.id,
    this.nom,
    this.description,
    this.marque,
    this.prix,
    this.modele,
    this.capacite,
    this.image,
    this.quantiteDisponible,
    this.type,
    this.modelCategorie,
    // this.user,
    // this.boutiqueid,
  );

  factory ModelProduit.fromMap(Map json) {
    return ModelProduit(
      json['id'],
      json['nom'],
      json['description'],
      json['marque'],
      json['prix'],
      json['modele'],
      json['capacite'],
      json['image'],
      json['quantiteDisponible'],
      json['type'],
      json['modelCategorie'],
      //json['user'],
      //json['boutiqueid']
    );
  }
}

/* Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nom'] = this.nom;
    data['description'] = this.description;
    data['marque'] = this.marque;
    data['prix'] = this.prix;
    data['marque'] = this.marque;
    data['capacite'] = this.capacite;
    data['image'] = this.image;
    data['quantite_disponible'] = this.quantiteDisponible;
    data['type'] = this.type;
    if (this.modelCategorie != null) {
      data['categorie'] = this.modelCategorie!.toJson();
    }
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.modelboutiques != null) {
      data['boutiques'] = this.modelboutiques!.map((v) => v.toJson()).toList();
    }
    return data;
  }*/

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
