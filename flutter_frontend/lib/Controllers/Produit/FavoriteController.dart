import 'package:flutter/material.dart';
import 'package:flutter_frontend/Models/ModelProduit.dart';
import 'package:get/get.dart';

class FavoriteController extends GetxController {
  var nombreProduit = 0.obs;
  var favoriListe = <ModelProduit>[];

  void ajoutFavorieToListe(ModelProduit modelProduit) {
    if (!favoriListe.contains(modelProduit)) {
      favoriListe.add(modelProduit);
      nombreProduit++;
    } else {
      Get.snackbar("Existe déjà",
          "Vous avez déjà ajouter cet produit dans votre liste de favorite!!",
          backgroundColor: Colors.red ,
          snackPosition: SnackPosition.BOTTOM,
          borderColor: Colors.orangeAccent,
          borderWidth: 2,
          barBlur: 0);
      ;
    }
  }
}
