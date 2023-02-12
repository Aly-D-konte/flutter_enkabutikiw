import 'package:flutter_frontend/Models/ModelProduit.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class FavoriteController extends GetxController {
  var nombreProduit = 0.obs;
  var favoriListe = <ModelProduit>[].obs;

  void ajoutFavorieToListe(ModelProduit modelProduit) {
    favoriListe.add(modelProduit);
    nombreProduit++;
  }
}
