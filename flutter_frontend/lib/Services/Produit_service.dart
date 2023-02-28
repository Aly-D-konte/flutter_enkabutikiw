import 'dart:convert';
import 'dart:ffi';
import 'package:http/http.dart' as http;

import 'package:flutter_frontend/Models/ModelProduit.dart';
import 'package:flutter_frontend/Services/globals.dart';

class ProduitServices {
  static Future<ModelProduit> ajoutProduit(
      String nom,
      String description,
      String marque,
      Long prix,
      String model,
      String capacite,
      String image,
      Long quantite_disponible,
      String type,
      String categorie,
      String boutiques,
      String user) async {
    Map data = {
      'nom': nom,
      'description': description,
      'marque': marque,
      'prix': prix,
      'model': model,
      'capacite': capacite,
      'image': image,
      'quantite_disponible': quantite_disponible,
      'type': type,
      'categorie': categorie,
      'boutiques': boutiques,
      'user': user,
    };
    var body = json.encode(data);
    var url = Uri.parse(baseUrl + 'produit/ajouter');

    http.Response response = await http.post(
      url,
      headers: headers,
      body: body,
    );
    print(response.body);
    Map responseMap = jsonDecode(response.body);
    ModelProduit modelProduit = ModelProduit.fromMap(responseMap);
    return modelProduit;
  }

//partie get
  static Future<List<ModelProduit>> getProduit() async {
    var url = Uri.parse(baseUrl + '/produit/liste');
    http.Response response = await http.get(url, headers: headers);

    List responseList = jsonDecode(response.body);

    List<ModelProduit> modelProduits = [];
    for (Map produitMap in responseList) {
      ModelProduit modelProduit = ModelProduit.fromMap(produitMap);
      modelProduits.add(modelProduit);
      // print("ca marche");
      print(responseList);
      // print("ca marche");
    }
    return modelProduits;
  }
}
