import 'package:flutter/material.dart';

import 'package:flutter_frontend/pages/panier/panier_detail.dart';
import 'package:get/get.dart';

import '../../Controllers/Produit/produit_quantite.dart';

class HomeAppBar extends StatelessWidget {
  HomeAppBar({super.key});

  ProduitQuantiteController produitQuantiteController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          //height: 500,
          color: Colors.white,
          padding: const EdgeInsets.all(25),
          // decoration: const BoxDecoration(),
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.arrow_back,
                  size: 20,
                  color: Colors.black,
                ),
              ),

              const Padding(padding: EdgeInsets.only(left: 20)),
              //Spacer donne de l'espace entre deux valeurs
              const Spacer(),
              const Badge(
                backgroundColor: Colors.red,
                padding: EdgeInsets.all(5),
                label: Text("30"),
                child: Icon(Icons.notification_important_outlined, size: 30),
              ),
              const SizedBox(
                width: 20,
              ),
              Badge(
                backgroundColor: Colors.red,
                padding: const EdgeInsets.all(5),
                label:
                    Text(produitQuantiteController.monPanier.value.toString()),
                child: GestureDetector(
                  child: const Icon(Icons.shopping_cart_outlined, size: 30),
                  onTap: () {
                    showDialog(
                        // barrierDismissible: false,
                        context: context,
                        builder: (ctx) => PanierAlert());
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
