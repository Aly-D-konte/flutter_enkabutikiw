import 'package:flutter/material.dart';
import 'package:flutter_frontend/pages/Boutique/Boutique_page.dart';
import 'package:flutter_frontend/pages/Compte/PageCompe.dart';
import 'package:flutter_frontend/pages/Categorie/PageCategorie.dart';
import 'package:flutter_frontend/pages/Favorite/PageFavorite.dart';
import 'package:flutter_frontend/pages/Produit/Page%20produit.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const ProduitPage(),
    const PageCategorie(),
    const PageBoutiques(),
     PageFavorite(),
    const PageCompte()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: CurvedNavigationBar(
        items: const <Widget>[
          Icon(Icons.home, size: 30, color: Colors.white),
          Icon(Icons.category_outlined, size: 30, color: Colors.white),
          Icon(Icons.shopping_bag_rounded, size: 30, color: Colors.white),
          Icon(Icons.favorite_border, size: 30, color: Colors.white),
          Icon(Icons.person_outline, size: 30, color: Colors.white),
        ],
        index: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        backgroundColor: Colors.transparent,
        height: 50,
        color: Colors.grey,
      ),
    );
  }
}
