import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_frontend/Models/Boutique_data.dart';
import 'package:flutter_frontend/pages/Commandes/PasserCommande.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../Controllers/Produit/produit_quantite.dart';
import '../../Models/Paniers.dart';
import '../../Services/database_services.dart';

class AffichagePanier extends StatefulWidget {
  const AffichagePanier(
      {super.key, required this.paniers, required this.boutiqueData});
  final Paniers paniers;
  final BoutiqueData boutiqueData;

  @override
  State<AffichagePanier> createState() => _AffichagePanierState();
}

class _AffichagePanierState extends State<AffichagePanier> {
  int itemCount = 1;
  ProduitQuantiteController produitQuantiteController = Get.find();
  // DatabaseServices _databaseServices = new DatabaseServices();
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
                      for (int i = 0;
                          i < widget.paniers.produits!.length;
                          i++) ...[
                        Text(
                          "${widget.paniers.produits![i].nom.toString()}",
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                              color: Colors.black),
                        ),
                      ],

                      // Text(
                      //   "r",
                      //   //paniers.produits![i].prix.toString() + " FCFA",
                      //   style: TextStyle(
                      //     fontWeight: FontWeight.normal,
                      //     color: Colors.orangeAccent,
                      //   ),
                      // ),
                      //la partie ou on va ajouté ou enlevSer une quantite
                      // Row(
                      //   children: [
                      //     Container(
                      //       padding: const EdgeInsets.all(3),
                      //       decoration: BoxDecoration(
                      //           color: Colors.orangeAccent,
                      //           borderRadius: const BorderRadius.only(
                      //               topLeft: Radius.circular(10),
                      //               bottomLeft: Radius.circular(10)),
                      //           boxShadow: [
                      //             BoxShadow(
                      //                 color: Colors.grey.withOpacity(0.5),
                      //                 spreadRadius: 1,
                      //                 blurRadius: 5)
                      //           ]),
                      //       child: const Icon(
                      //         CupertinoIcons.minus,
                      //       ),
                      //     ),
                      //     Container(
                      //       margin: const EdgeInsets.symmetric(horizontal: 10),
                      //       child: const Text(
                      //         "01",
                      //         style: TextStyle(
                      //             fontSize: 16, fontWeight: FontWeight.normal),
                      //       ),
                      //     ),
                      //     Container(
                      //       padding: const EdgeInsets.all(5),
                      //       decoration: BoxDecoration(
                      //           color: Colors.orangeAccent,
                      //           borderRadius: const BorderRadius.only(
                      //               topRight: Radius.circular(10),
                      //               bottomRight: Radius.circular(10)),
                      //           boxShadow: [
                      //             BoxShadow(
                      //                 color: Colors.grey.withOpacity(0.5),
                      //                 spreadRadius: 1,
                      //                 blurRadius: 10)
                      //           ]),
                      //       child: const Icon(
                      //         CupertinoIcons.plus,
                      //       ),
                      //     )
                      //   ],
                      // )
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
                                // QuickAlert.show(
                                //   context: context,
                                //   type: QuickAlertType.success,
                                //   text: 'Transaction Completed Successfully!',
                                // );
                              },
                              child: const Icon(
                                CupertinoIcons.plus,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
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
