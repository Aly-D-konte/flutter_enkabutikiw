import 'dart:convert';

import 'package:flutter_frontend/Models/boutique.dart';
import 'package:http/http.dart' as http;

import 'globals.dart';

class DatabaseServices {
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
    print("ca marche");
  }
}
