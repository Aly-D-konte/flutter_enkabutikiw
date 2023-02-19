import 'package:flutter/material.dart';
import 'package:flutter_frontend/Controllers/Produit/FavoriteController.dart';
import 'package:flutter_frontend/Models/ModelProduit.dart';
import 'package:flutter_frontend/pages/panier/ajoutPanier.dart';
import 'package:get/get.dart';

class PageFavorite extends StatelessWidget {
  PageFavorite({Key? key}) : super(key: key);

  FavoriteController favoriteController = Get.put(FavoriteController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                "Mes Favoris",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25),
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(favoriteController.nombreProduit.value.toString()),
                    ],
                  ),
                ],
              ),
            ),
            Container(
                height: 140,
                margin: const EdgeInsets.symmetric(horizontal: 3, vertical: 15),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "favoriteController",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                                color: Colors.black),
                          ),
                          // Text(
                          //   widget.modelCommande.modelPanier!.modelProduit.prix
                          //       .toString(),
                          //   style: TextStyle(
                          //       fontWeight: FontWeight.normal,
                          //       color: Colors.orangeAccent,
                          //       fontSize: 15),
                          // ),
                          const Text(
                            "Boutique : KONTE SHOP",
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.orangeAccent,
                                fontSize: 15),
                          ),
                          //la partie ou on va ajouté ou enlever une quantite
                          Row(
                            children: [
                              Container(
                                height: 20,
                                width: 90,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: Colors.orange,
                                    borderRadius: BorderRadius.circular(5)),
                                child: const Text(
                                  "ENCOURS",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              //                     AjoutPanier(
                              //   modelProduit: modelProduit,
                              // ),
                            ],
                          )
                        ],
                      ),
                    ),
                    const Spacer(),
                    // Container(
                    //   height: 70,
                    //   width: 40,
                    //   margin: const EdgeInsets.only(right: 15),
                    //   child: CachedNetworkImage(
                    //     fit: BoxFit.cover,
                    //     height: 120,
                    //     width: 120,
                    //     imageUrl:
                    //         widget.modelCommande.modelPanier.modelProduit.image!,
                    //     placeholder: (context, url) =>
                    //         new CircularProgressIndicator(),
                    //     errorWidget: (context, url, error) =>
                    //         new Icon(Icons.electric_rickshaw_sharp),
                    //   ),
                    // ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 3),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Icon(Icons.delete, color: Colors.red),
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
