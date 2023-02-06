import 'package:flutter/material.dart';
import 'package:flutter_frontend/pages/Compte/PageCompe.dart';
import 'package:flutter_frontend/pages/PageCategorie.dart';
import 'package:flutter_frontend/pages/Souhait/PageSouhait.dart';

import '../Boutique_page.dart';
import '../Page produit.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  // bottom nav bar
  int _selectedIndex = 0;
  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [const ProduitPage(),
  PageCategorie(),
    PageBoutiques(),
  PageSouhait(),
  PageCompte()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      appBar: AppBar(
          leading: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          automaticallyImplyLeading: true,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.search, color: Colors.white),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.add_shopping_cart, color: Colors.white),
              onPressed: () {},
            ),
          ]
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _navigateBottomBar,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Accuiel'),
          BottomNavigationBarItem(icon: Icon(Icons.bolt), label: 'Categories'),
          BottomNavigationBarItem(
            icon: Icon(Icons.bolt),
            label: 'Boutique',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble_rounded), label: 'Souhait'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Compte'),
        ],
      ),
    );
  }
}
