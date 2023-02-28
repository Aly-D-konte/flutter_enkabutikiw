import 'dart:convert';
import 'package:flutter_frontend/Models/ModelCommande.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_frontend/Services/globals.dart';

class CommandeServices {
  // static Future<ModelCommande> ajoutCategorie(String code, String date, String statut, String panier) async {
  //   Map data = {
  //     'nom': nom,
  //     'image': image,
  //   };
  //   var body = json.encode(data);
  //   var url = Uri.parse(baseUrl + '/commande/ajouter/${panier_id}');

  //   http.Response response = await http.post(
  //     url,
  //     headers: headers,
  //     body: body,
  //   );
  //   print(response.body);
  //   Map responseMap = jsonDecode(response.body);
  //   ModelCategorie modelCategorie = ModelCategorie.fromMap(responseMap);
  //   return modelCategorie;
  // }

//partie get
  static Future<List<ModelCommande>> getCommande(int id) async {
    var url = Uri.parse(baseUrl + '/commande/liste/${id}');
    http.Response response = await http.get(url, headers: headers);

    //List responseList = jsonDecode(response.body);

    //print(jsonResponse);
    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = json.decode(response.body);
      print(jsonResponse);
      return jsonResponse
          .map((commande) => ModelCommande.fromJson(commande))
          .toList();
    } else {
      throw Exception('impossible de retrouver la commande');
    }
    // List<ModelCommande> modelCommandes = [];
    // for (Map commandeMap in responseList) {
    //   ModelCommande modelCommande = ModelCommande.fromMap(commandeMap);
    //   modelCommandes.add(modelCommande);
    //   print("ca marche");
    //   print(responseList);
    //   print("ca marche");
    // }
    //return modelCommandes;
  }
}
