import 'dart:convert';
import 'dart:ffi';
import 'package:http/http.dart' as http;

import 'package:flutter_frontend/Models/ModelProduit.dart';
import 'package:flutter_frontend/Services/globals.dart';

class ProduitServices {
  static Future<http.Response> ajoutProduit(
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
    // Map responseMap = jsonDecode(response.body);
    // ModelProduit modelProduit = ModelProduit.fromJson(responseMap);
    return response;
  }

//partie get
  static Future<List<ModelProduit>> getProduit() async {
    var url = Uri.parse(baseUrl + '/produit/liste');
    http.Response response = await http.get(url, headers: headers);

    List responseList = jsonDecode(response.body);

    if (response.statusCode == 200) {
      List<ModelProduit> items = [];
      //get the data from the response
      String jsonString = response.body;
      //Convert to List<Map>
      var jsonByte = response.bodyBytes;

      //Convert to List<Map>
      List data = json.decode(utf8.decode(jsonByte));
      //List data = jsonDecode(jsonString);
      items = data.map((e) => ModelProduit.fromJson(e)).toList();
      // for (int i = 0; i < items.length; i++) {
      //   print(items[i].user!.adresse);
      //   print("laaaaaaaaa");
      // }

      print("data");
      //print(items[1].boutiques.);
      return data.map((e) => ModelProduit.fromJson(e)).toList();
      //return items;
    } else {
      throw ("Liste introuvable : ${response.body}");
    }

    //   List<ModelProduit> modelProduits = [];
    //   for (js produitMap in responseList) {
    //     ModelProduit modelProduit = ModelProduit.fromJson(produitMap);
    //     modelProduits.add(modelProduit);
    //     print("ca marche");
    //     print(responseList);
    //     print("ca marche");
    //     print(modelProduit.modelBoutiques!.nom);
    //     print("ca marche");
    //   }
    //   return modelProduits;
    // }
  }
}
