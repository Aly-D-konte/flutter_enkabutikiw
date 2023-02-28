import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_frontend/Models/Boutique_data.dart';
import 'package:flutter_frontend/pages/panier/panier_affichage.dart';
import 'package:provider/provider.dart';

import '../../Models/Paniers.dart';
import '../../Services/Boutique_services.dart';
import '../../Services/globals.dart';

class MonPanier extends StatefulWidget {
  const MonPanier({super.key});

  @override
  State<MonPanier> createState() => _MonPanierState();
}

class _MonPanierState extends State<MonPanier> {
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

  @override
  Widget build(BuildContext context) {
    return paniers == null
        ? const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          )
        : Scaffold(
            appBar: AppBar(
              // backgroundColor: Colors.amber,
              title: Center(
                  child: Text(
                "Panier",
              )),
            ),
            body: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Consumer<BoutiqueData>(
                builder: (context, boutiqueData, child) {
                  return ListView.builder(
                    itemCount: boutiqueData.paniers.length,
                    itemBuilder: (context, index) {
                      Paniers panier = boutiqueData.paniers[index];
                      return AffichagePanier(
                        paniers: panier,
                        boutiqueData: boutiqueData,
                      );
                    },
                  );
                },
              ),
            ),
          );
  }
}
