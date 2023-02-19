import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_frontend/Controllers/Produit/produit_quantite.dart';
import 'package:flutter_frontend/Models/Boutique_data.dart';
import 'package:flutter_frontend/Models/ModelProduit.dart';
import 'package:flutter_frontend/pages/Menu/menuBottom.dart';
import 'package:flutter_frontend/pages/Produit/DetailProduit_affichage.dart';
import 'package:flutter_frontend/pages/Produit/produit_detail_page.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../Models/ModelCategorie.dart';
import '../../Models/constante.dart';

class ProduitAffichage extends StatefulWidget {
  const ProduitAffichage(
      {Key? key, required this.modelProduit, required this.boutiqueData})
      : super(key: key);
  final ModelProduit modelProduit;
  final BoutiqueData boutiqueData;

  @override
  State<ProduitAffichage> createState() => _ProduitAffichageState();
}

class _ProduitAffichageState extends State<ProduitAffichage> {
  //Cet controller permet de gerer le scroll

  final ScrollController _controller = ScrollController();
  ProduitQuantiteController produitQuantiteController =
      Get.put(ProduitQuantiteController());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .49,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width * .5,
             child: Card(
                shadowColor: Colors.black,
                elevation: 5,
                child: Container(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Icon(
                            Icons.favorite_border,
                            color: Colors.red,
                          )
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          useindex = true;
                         // selectedPageIndex = 5;
                          modelProduit.add(widget.modelProduit);
                          Navigator.pop(context);
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailProduit(modelProduit: widget.modelProduit)));
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => DetailProduit(
                          //           modelProduit: widget.modelProduit)),
                          // );
                        },
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            height: 120,
                            width: 120,
                            imageUrl: widget.modelProduit.image!,
                            placeholder: (context, url) =>
                                new CircularProgressIndicator(),
                            errorWidget: (context, url, error) =>
                                new Icon(Icons.electric_rickshaw_sharp),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(bottom: 8),
                        alignment: Alignment.center,
                        child: Text(
                          widget.modelProduit.nom!,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      //Co²
                      Text(
                        widget.modelProduit.prix.toString() + "\FCFA",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
