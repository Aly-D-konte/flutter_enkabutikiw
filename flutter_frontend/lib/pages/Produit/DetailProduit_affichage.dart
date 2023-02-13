import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_frontend/Controllers/Produit/FavoriteController.dart';
import 'package:flutter_frontend/Controllers/Produit/produit_quantite.dart';
import 'package:flutter_frontend/Models/Boutique_data.dart';
import 'package:flutter_frontend/Models/ModelProduit.dart';
import 'package:flutter_frontend/pages/Menu/menuBottom.dart';
import 'package:flutter_frontend/pages/panier/ajoutPanier.dart';
import 'package:get/get.dart';

import '../../Models/PanierModel.dart';

class DetailProduit extends StatelessWidget {
  DetailProduit({super.key, required this.modelProduit});
  final ModelProduit modelProduit;
  int itemCount = 1;
  ProduitQuantiteController produitQuantiteController = Get.find();

  //cet controller concerne la partie favorite

  FavoriteController favoriteController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.amber,
              height: 200,
            ),
            Container(
              child: Card(
                shadowColor: Colors.black,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50)),
                  height: 600,
                  child: Column(
                    children: [
                      //l'image et la description
                      Padding(
                        padding: const EdgeInsets.all(2),
                        child: Row(
                          children: [
                            //container contenant l'image
                            Container(
                                // color: Colors.red,

                                width: MediaQuery.of(context).size.width * .40,
                                height: 200,
                                child: Expanded(
                                    child: Hero(
                                  tag: modelProduit.id,
                                  child: CachedNetworkImage(
                                    fit: BoxFit.cover,
                                    height: 120,
                                    width: 120,
                                    imageUrl: modelProduit.image,
                                    placeholder: (context, url) =>
                                        const CircularProgressIndicator(),
                                    errorWidget: (context, url, error) =>
                                        const Icon(
                                            Icons.electric_rickshaw_sharp),
                                  ),
                                ))),
                            //container contenant la description
                            Expanded(
                              child: SizedBox(
                                //  color: Colors.amber,
                                height: 200,
                                child: Column(
                                  children: [
                                    // le titre et licon favorite
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 40,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            'Description',
                                            style: TextStyle(fontSize: 22),
                                          ),
                                          //la partie ajout au souhait
                                          IconButton(
                                              onPressed: () {
                                                favoriteController
                                                    .ajoutFavorieToListe(
                                                        modelProduit);
                                              },
                                              icon: const Icon(
                                                Icons.favorite,
                                                color: Colors.red,
                                              ))
                                        ],
                                      ),
                                    ), 
                                    // la description en elle meme
                                    Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Text(modelProduit.description),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      //la partie d'ajout de quantite
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  backgroundColor: Colors.orangeAccent,
                                  elevation: 20,
                                  minimumSize: Size(40, 30),
                                  // shadowColor: Colors.blue
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          bottomLeft: Radius.circular(10)))),
                              onPressed: () {
                                produitQuantiteController.deleteQuantite();
                              },
                              child: const Icon(
                                CupertinoIcons.minus,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          //La partie nombre de quantité
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Obx(
                              () => Text(
                                produitQuantiteController.nombreQuantite
                                    .toString()
                                    .padLeft(2, "0"),
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(color: Colors.black),
                              ),
                            ),
                          ),
                          //la partie plus
                          Container(
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  backgroundColor: Colors.orangeAccent,
                                  elevation: 20,
                                  minimumSize: Size(40, 30),
                                  // shadowColor: Colors.blue
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(10),
                                          bottomRight: Radius.circular(10)))),
                              onPressed: () {
                                produitQuantiteController.addQuantite();
                              },
                              child: const Icon(
                                CupertinoIcons.plus,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(3),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        "Prix",
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 24),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Text(modelProduit.prix.toString())
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: const [
                                      Text(
                                        "Bouique",
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 24),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Text("KONTE SHOP")
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: const [
                                      Text(
                                        "Categorie",
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 24),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Text("Refrigerateur")
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        "Type",
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 24),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Text(modelProduit.type)
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        "Marque",
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 24),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Text(modelProduit.marque)
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        "Modéle",
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 24),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Text(modelProduit.modele)
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        "Capacité",
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 24),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Text(modelProduit.capacite)
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
             AjoutPanier( modelProduit: modelProduit,),
          ],
        ),
      ),
    );
  }
}
