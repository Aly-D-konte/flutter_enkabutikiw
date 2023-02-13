import 'package:flutter/material.dart';
import 'package:flutter_frontend/Controllers/Produit/produit_quantite.dart';
import 'package:flutter_frontend/Models/ModelProduit.dart';
import 'package:get/get.dart';

import '../../Models/PanierModel.dart';

class AjoutPanier extends StatelessWidget {
  AjoutPanier({super.key, required this.modelProduit});
  final ModelProduit modelProduit;

  ProduitQuantiteController produitQuantiteController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      backgroundColor: Colors.orangeAccent,
                      elevation: 20,
                      minimumSize: Size(150, 40),
                      // shadowColor: Colors.blue
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  onPressed: () {
                    produitQuantiteController.ajoutPAnier(modelProduit);
                  },
                  child: Text(
                    "Ajouter au panier".toUpperCase(),
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.normal),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
