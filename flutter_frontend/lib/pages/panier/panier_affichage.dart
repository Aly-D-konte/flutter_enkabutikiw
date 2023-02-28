import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_frontend/Models/Boutique_data.dart';

import '../../Models/Paniers.dart';

class AffichagePanier extends StatelessWidget {
  const AffichagePanier(
      {super.key, required this.paniers, required this.boutiqueData});
  final Paniers paniers;
  final BoutiqueData boutiqueData;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 110,
            margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Row(
              children: [
                Radio(
                    value: "",
                    groupValue: "",
                    activeColor: Colors.black,
                    onChanged: (index) {}),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        paniers.produits![0].nom.toString(),
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                            color: Colors.black),
                      ),
                      Text(
                        paniers.produits![0].prix.toString() + " FCFA",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.orangeAccent,
                        ),
                      ),
                      //la partie ou on va ajouté ou enlever une quantite
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(3),
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
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            child: const Text(
                              "01",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.normal),
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
                  width: 70,
                  margin: const EdgeInsets.only(right: 5),
                  child: Image.asset(
                    "assets/images/images2.jpg",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Icon(Icons.delete, color: Colors.red),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
