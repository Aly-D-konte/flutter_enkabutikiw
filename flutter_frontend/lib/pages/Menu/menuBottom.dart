import 'package:flutter/material.dart';
import 'package:flutter_frontend/pages/Boutique/Boutique_page.dart';
import 'package:flutter_frontend/pages/Compte/PageCompe.dart';
import 'package:flutter_frontend/pages/Categorie/PageCategorie.dart';
import 'package:flutter_frontend/pages/Favorite/PageFavorite.dart';
import 'package:flutter_frontend/pages/Produit/Page%20produit.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../Controllers/Produit/produit_quantite.dart';
import '../../Models/Boutique_data.dart';
import '../../Models/Paniers.dart';
import '../../Models/constante.dart';
import '../../Services/Boutique_services.dart';
import '../../Services/globals.dart';
import '../panier/details.dart';

class Homepage extends StatefulWidget {
  Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Icon customIcon = const Icon(Icons.search);
  Widget customSearchBar = const Text('Mon journal personnel');

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
    List<Paniers>? paniers;

    getPanier() async {
      paniers = await DatabaseServices.getPanier(usId);
      Provider.of<BoutiqueData>(context, listen: false).paniers = paniers!;
      setState(() {});
    }

    @override
    void initState() {
      // TODO: implement initState
      super.initState();
      getPanier();
    }

    ProduitQuantiteController produitQuantiteController =
        Get.put(ProduitQuantiteController());

    return Scaffold(
      appBar: AppBar(
        title: customSearchBar,
        elevation: 1,
        actions: [
          Row(
            children: [
              // IconButton(
              //   onPressed: () {
              //     setState(() {
              //       if (customIcon.icon == Icons.search) {
              //         customIcon = const Icon(Icons.cancel);
              //         customSearchBar = const ListTile(
              //           leading: Icon(
              //             Icons.search,
              //             color: Colors.white,
              //             size: 28,
              //           ),
              //           title: TextField(
              //             decoration: InputDecoration(
              //               hintText: 'type in journal name...',
              //               hintStyle: TextStyle(
              //                 color: Colors.white,
              //                 fontSize: 18,
              //                 fontStyle: FontStyle.italic,
              //               ),
              //               border: InputBorder.none,
              //             ),
              //             style: TextStyle(
              //               color: Colors.white,
              //             ),
              //           ),
              //         );
              //       }
              //     });
              //   },
              //   icon: customIcon,
              // ),
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
                        '${Provider.of<BoutiqueData>(context, listen: false).paniers.length}')),
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
