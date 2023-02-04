class ModelCategorie{
  int id;
  final String nom;
  final String image;

  ModelCategorie(
      this.id,
      this.nom,
      this.image,

      );

  factory ModelCategorie.fromMap(Map json) {
    return ModelCategorie(
      json['id'],
      json['nom'],
      json['image'],

    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nom'] = this.nom;
    data['image'] = this.image;
   return data;
}
}