import 'dart:convert';

import 'package:flutter_frontend/Models/boutique.dart';
import 'package:http/http.dart' as http;

import '../Models/Paniers.dart';
import 'globals.dart';

class DatabaseServices {
  //La partie boutique debut
  static Future<ModelBoutiques> ajoutBoutique(String nom, String description,
      String adresse, String image, bool etat, String user) async {
    Map data = {
      'nom': nom,
      'description': description,
      'adresse': adresse,
      'image': image,
      'etat': etat,
      'user': user,
    };
    var body = json.encode(data);
    var url = Uri.parse(baseUrl + 'boutique/ajouter');

    http.Response response = await http.post(
      url,
      headers: headers,
      body: body,
    );
    print(response.body);
    Map responseMap = jsonDecode(response.body);
    ModelBoutiques modelboutiques = ModelBoutiques.fromMap(responseMap);
    return modelboutiques;
  }

//partie get
  static Future<List<ModelBoutiques>> getBoutiques() async {
    var url = Uri.parse(baseUrl + '/boutique/liste');
    http.Response response = await http.get(url, headers: headers);

    List responseList = jsonDecode(response.body);
    List<ModelBoutiques> modelboutiques = [];
    for (Map boutiqueMap in responseList) {
      ModelBoutiques boutique = ModelBoutiques.fromMap(boutiqueMap);
      modelboutiques.add(boutique);
    }
    return modelboutiques;
  }

  //finnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn

//La partie produits debuttttttttttttttttttttttttttt

  static Future<List<Paniers>> getPanier(int id) async {
    var url = Uri.parse(baseUrl + '/panier/PanierParUser/$id');
    http.Response response = await http.get(url, headers: headers);

    List responseList = jsonDecode(response.body);
    print(responseList);
    print('lolllllllllllll');
    List<Paniers> paniers = [];

    // for (Map<String, dynamic> panierMap in responseList) {
    //   Paniers panier = Paniers.fromJson(panierMap);
    //   print("caaaaa marche");
    //   print(panierMap['user['nom']']);
    //   paniers.add(panier);
    // }

    // return paniers;

    if (response.statusCode == 200) {
      List<Paniers> items = [];
      //get the data from the response
      String jsonString = response.body;
      //Convert to List<Map>
      var jsonByte = response.bodyBytes;

      //Convert to List<Map>
      List data = json.decode(utf8.decode(jsonByte));
      //List data = jsonDecode(jsonString);
      items = data.map((e) => Paniers.fromJson(e)).toList();
      // for (int i = 0; i < items.length; i++) {
      //   print(items[i].user!.adresse);
      //   print("laaaaaaaaa");
      // }

      print("data");
      //print(items[0].produits!.length);
      return data.map((e) => Paniers.fromJson(e)).toList();
      //return items;
    } else {
      throw ("Liste introuvable : ${response.body}");
    }
  }
}
