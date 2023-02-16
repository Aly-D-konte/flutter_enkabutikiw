import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_frontend/Controllers/Produit/produit_quantite.dart';
import 'package:get/get.dart';

class PageCommande extends StatelessWidget {
  PageCommande({super.key});

  // ProduitQuantiteController produitQuantiteController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.amber,
              height: 100,
            ),
            for (int i = 1; i < 6; i++)
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
                          const Text(
                            " Telephone ",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                                color: Colors.black),
                          ),
                          const Text(
                            "Prix : 45 00O FCFA",
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.orangeAccent,
                                fontSize: 15),
                          ),
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
                        imageUrl: "image",
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
          ],
        ),
      ),
    );
  }
}
