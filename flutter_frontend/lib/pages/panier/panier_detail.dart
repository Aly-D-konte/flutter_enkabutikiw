import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_frontend/Controllers/Produit/produit_quantite.dart';
import 'package:get/get.dart';

import '../../Models/ModelProduit.dart';
import '../../Models/PanierModel.dart';

class PanierAlert extends StatelessWidget {
  PanierAlert({super.key, required this.modelPanier});
  final ModelPanier modelPanier;

  //ProduitQuantiteController produitQuantiteController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,

      //popup pour le panier
      
    );
  }
}
