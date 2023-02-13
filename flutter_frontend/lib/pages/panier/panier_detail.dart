import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_frontend/Controllers/Produit/produit_quantite.dart';
import 'package:get/get.dart';

class PanierAlert extends StatelessWidget {
  PanierAlert({super.key});

  ProduitQuantiteController produitQuantiteController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: AlertDialog(
        backgroundColor: Colors.grey,

        //popup pour le panier
        content: Container(
          child: ListView.builder(itemBuilder: (context, index) {
            var actualPanier = produitQuantiteController.monPanier[index];

            return Column(
              children: [
                Container(
                  height: 110,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 3, vertical: 15),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      Radio(
                          value: "",
                          groupValue: "",
                          activeColor: Colors.black,
                          onChanged: (index) {}),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              " Quantite : ${actualPanier.quantite}",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black),
                            ),
                            Text(
                              actualPanier.modelProduit.prix as String,
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  color: Colors.orangeAccent,
                                  fontSize: 15),
                            ),
                            //la partie ou on va ajouté ou enlever une quantite
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                      color: Colors.orangeAccent,
                                      borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          bottomLeft: Radius.circular(10)),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 1,
                                            blurRadius: 5)
                                      ]),
                                  child: const Icon(
                                    CupertinoIcons.minus,
                                    size: 15,
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: const Text(
                                    "01",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      color: Colors.orangeAccent,
                                      borderRadius: const BorderRadius.only(
                                          topRight: Radius.circular(10),
                                          bottomRight: Radius.circular(10)),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 1,
                                            blurRadius: 10)
                                      ]),
                                  child: const Icon(
                                    CupertinoIcons.plus,
                                    size: 15,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      const Spacer(),
                      Container(
                        height: 70,
                        width: 40,
                        margin: const EdgeInsets.only(right: 15),
                        child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          height: 120,
                          width: 120,
                          imageUrl: actualPanier.modelProduit.image,
                          placeholder: (context, url) =>
                              new CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              new Icon(Icons.electric_rickshaw_sharp),
                        ),
                      ),
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
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                  padding: EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.orangeAccent,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                      // const Padding(
                      //   padding: EdgeInsets.symmetric(horizontal: 1),
                      //   child: Text(
                      //     "Ajouter un code coupon",
                      //     style: TextStyle(
                      //       color: Color(0XFF4C53A5),
                      //       fontWeight: FontWeight.normal,
                      //     ),
                      //   ),
                      // )
                    ],
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  height: 120,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "Total:",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.normal),
                          ),
                          Text(
                            "48 000 FCFA",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.normal),
                          )
                        ],
                      ),
                      Container(
                        width: 700,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(10)),
                        child: const Text(
                          "Passer la commande",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
