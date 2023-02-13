import 'package:flutter/material.dart';
import 'package:flutter_frontend/pages/Boutique/Boutique_page.dart';
import 'package:flutter_frontend/pages/Compte/PageCompe.dart';
import 'package:flutter_frontend/pages/Categorie/PageCategorie.dart';
import 'package:flutter_frontend/pages/Favorite/PageFavorite.dart';
import 'package:flutter_frontend/pages/Produit/Page%20produit.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:get/get.dart';

import '../../Controllers/Produit/produit_quantite.dart';
import '../../Models/constante.dart';
import '../panier/panier_detail.dart';

class Homepage extends StatefulWidget {
   Homepage({Key? key}) : super(key: key);


  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  int curveindex = 0 ;
  //int _selectedIndex = 0;
//ModelProduit modelProduitsss = new ModelProduit(1,'Samsung', "SAMSUNG A70","SAMSUNG",10000,"modele1","image","Capacite 1",3,"Industriel",ModelCategorie(1,"Telephone", "image"));

  final List<Widget> _pages = [
    ProduitPage(),
     PageCategorie(),
    PageBoutiques(),
     PageFavorite(),
     PageCompte(),
  //  DetailProduit(modelProduit: modelProduit[0]),
  ];


  @override
  Widget build(BuildContext context) {
    ProduitQuantiteController produitQuantiteController = Get.put(ProduitQuantiteController());

    return Scaffold(
    appBar: AppBar(actions: [const Badge(
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
        Text(produitQuantiteController.monPanier.length.toString()),
        child: GestureDetector(
          child: const Icon(Icons.shopping_cart, size: 30),
          onTap: () {
            showDialog(
              // barrierDismissible: false,
                context: context,
                builder: (ctx) => PanierAlert());
          },
        ),
      ),],),
      body: useindex ? _pages[selectedPageIndex] : _pages[curveindex],
      bottomNavigationBar: CurvedNavigationBar(
        items: const <Widget>[
          Icon(Icons.home, size: 30, color: Colors.white),
          Icon(Icons.category_outlined, size: 30, color: Colors.white),
          Icon(Icons.shopping_bag_rounded, size: 30, color: Colors.white),
          Icon(Icons.favorite_border, size: 30, color: Colors.white),
          Icon(Icons.person_outline, size: 30, color: Colors.white),
        ],
        index: curveindex,
        onTap: (index) {
          setState(() {
            useindex = false;
            curveindex = index;
          });
        },
        backgroundColor: Colors.transparent,
        height: 50,
        color: Colors.grey,
      ),
    );
  }
}
