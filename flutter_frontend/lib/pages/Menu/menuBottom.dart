import 'package:flutter/material.dart';
import 'package:flutter_frontend/Models/Boutique_data.dart';
import 'package:flutter_frontend/Models/ModelCategorie.dart';
import 'package:flutter_frontend/pages/Boutique/Boutique_page.dart';
import 'package:flutter_frontend/pages/Compte/PageCompe.dart';
import 'package:flutter_frontend/pages/Categorie/PageCategorie.dart';
import 'package:flutter_frontend/pages/Favorite/PageFavorite.dart';
import 'package:flutter_frontend/pages/Produit/Page%20produit.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:get/get.dart';

import '../../Controllers/Produit/produit_quantite.dart';
import '../../Models/constante.dart';
import '../panier/details.dart';
import '../panier/panier_detail.dart';

class Homepage extends StatefulWidget {
  Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int curveindex = 0;

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
    ProduitQuantiteController produitQuantiteController =
        Get.put(ProduitQuantiteController());

    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        actions: [
          Row(
            children: [
              const Badge(
                backgroundColor: Colors.red,
                padding: EdgeInsets.all(2),
                label: Center(child: Text("0")),
                child: Icon(Icons.notification_important_outlined, size: 30),
              ),
              const SizedBox(
                width: 20,
              ),
              Badge(
                //alignment: AlignmentDirectional.topEnd,

                backgroundColor: Colors.red,
                // textStyle: TextStyle(height: 30),
                padding: const EdgeInsets.all(3),
                label: Center(
                    child: Text(
                        produitQuantiteController.monPanier.length.toString())),
                child: GestureDetector(
                  child: const Icon(Icons.shopping_cart, size: 30),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => MonPanier()));
                  },
                ),
              ),
            ],
          ),
        ],
      ),
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
