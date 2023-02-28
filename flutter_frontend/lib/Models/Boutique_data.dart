import 'package:flutter/material.dart';
import 'package:flutter_frontend/Models/ModelCategorie.dart';
import 'package:flutter_frontend/Models/ModelCommande.dart';
import 'package:flutter_frontend/Models/boutique.dart';

import '../Services/Boutique_services.dart';
import 'ModelProduit.dart';
import 'Paniers.dart';

class BoutiqueData extends ChangeNotifier {
  List<ModelBoutiques> modelboutiques = [];
  List<ModelProduit> modelProduits = [];
  List<ModelCategorie> modelCategories = [];
  List<ModelCommande> modelCommandes = [];

  List<Paniers> paniers = [];
  List<Paniers> items = [];

//La partie ajout
  void ajoutBoutique(String nom, String description, String adresse,
      String image, bool etat, String user) async {
    ModelBoutiques boutique = await DatabaseServices.ajoutBoutique(
        nom, description, adresse, image, etat, user);
    modelboutiques.add(boutique);
    notifyListeners();
  }

//La partie modification
  void modifierBoutique(ModelBoutiques modelboutiques) {
    // boutiques.toggle();
    notifyListeners();
  }

//La partie suppression

  void supprimerBoutique(ModelBoutiques boutique) async {
    modelboutiques.remove(boutique);
    notifyListeners();
  }
}
