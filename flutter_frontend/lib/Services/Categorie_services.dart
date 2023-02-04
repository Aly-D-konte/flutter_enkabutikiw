import 'dart:convert';
import 'package:flutter_frontend/Models/ModelCategorie.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_frontend/Services/globals.dart';

class CategorieServices{



  static Future<ModelCategorie> ajoutCategorie(String nom, String image) async {
    Map data = {
      'nom': nom,
      'image': image,
    };
    var body = json.encode(data);
    var url = Uri.parse(baseUrl + '/categorie/ajouter');

    http.Response response = await http.post(
      url,
      headers: headers,
      body: body,
    );
    print(response.body);
    Map responseMap = jsonDecode(response.body);
    ModelCategorie modelCategorie = ModelCategorie.fromMap(responseMap);
    return modelCategorie;
  }

//partie get
  static Future<List<ModelCategorie>> getCategorie() async {
    var url = Uri.parse(baseUrl + '/categorie/liste');
    http.Response response = await http.get(url, headers: headers);


    List responseList = jsonDecode(response.body);
    List<ModelCategorie> modelCategories = [];
    for (Map categorieMap in responseList) {
      ModelCategorie modelCategorie = ModelCategorie.fromMap(categorieMap);
      modelCategories.add(modelCategorie);
      print("ca marche");
      print(responseList);
      print("ca marche");
    }
    return modelCategories;

  }
}