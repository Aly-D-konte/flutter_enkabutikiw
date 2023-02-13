import 'package:flutter_frontend/Models/ModelProduit.dart';
import 'package:flutter_frontend/Models/PanierModel.dart';
import 'package:get/get.dart';

class ProduitQuantiteController extends GetxController {
  var nombreQuantite = 1.obs;
  //pour que ça increment si on clique
  void deleteQuantite() {
    if (nombreQuantite.value > 1) {
      nombreQuantite.value--;
    }
  }

  //pour que ça de-increment si on clique
  void addQuantite() {
    nombreQuantite.value++;
  }

//La partie panier commence ici
  var totalQauntite = 0.obs;
  var totalMonatnt = 0.obs;
  var monPanier = <ModelPanier>[].obs;
//La partie ajout au panier

  void ajoutPAnier(ModelProduit modelProduit) {
    final index =
        monPanier.indexWhere((element) => element.modelProduit == modelProduit);
    if (index > 0) {
      //On verifie si le produit existe et on modifie la quantité
      monPanier[index] = ModelPanier(
          modelProduit: modelProduit,
          quantite: (nombreQuantite.value + monPanier[index].quantite));
    } else {
      monPanier.add(ModelPanier(
          modelProduit: modelProduit, quantite: nombreQuantite.value));
    }
    totalQauntite.value = totalQauntite.value + nombreQuantite.value;
    nombreQuantite.value = 1;
  }

  void initiliaseQuantite() {
    nombreQuantite.value = 1;
  }
}
