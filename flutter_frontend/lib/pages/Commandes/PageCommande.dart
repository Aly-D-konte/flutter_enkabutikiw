import 'package:flutter/material.dart';
import 'package:flutter_frontend/pages/Commandes/AffichageCommande.dart';

import 'package:provider/provider.dart';

import '../../Models/Boutique_data.dart';
import '../../Models/ModelCommande.dart';
import '../../Services/Commande_services.dart';
import '../../Services/globals.dart';

class PageCommande extends StatefulWidget {
  PageCommande({super.key});

  @override
  State<PageCommande> createState() => _PageCommandeState();
}

class _PageCommandeState extends State<PageCommande> {
  // List<ModelCommande> modelCommandess = [];
  List<ModelCommande> modelCommandess = [];

  CommandeServices commandes = CommandeServices();

  // getCommande() async {
  //   modelCommandess = await CommandeServices.getCommande();
  //   Provider.of<BoutiqueData>(context, listen: false).modelCommandes =
  //       modelCommandess;

  //   setState(() {});
  // }

  getCommande() async {
    modelCommandess = await CommandeServices.getCommande(usId);
    Provider.of<BoutiqueData>(context, listen: false).modelCommandes =
        modelCommandess;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getCommande();
  }

  @override
  Widget build(BuildContext context) {
    return modelCommandess == null
        ? const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
            body: Column(
              children: [
                Container(
                  color: Colors.amber,
                  height: 100,
                ),
                Flexible(
                  child: Consumer<BoutiqueData>(
                      builder: (context, BoutiqueData, child) {
                    return SingleChildScrollView(
                      child: Container(
                        child: Column(
                          //alignment: WrapAlignment.spaceAround,
                          children: [
                            // Text("${BoutiqueData.modelCommandes[1].id}")
                            for (int i = 0;
                                i < BoutiqueData.modelCommandes.length;
                                i++)
                              AffichageCommande(
                                modelCommande: BoutiqueData.modelCommandes[i],
                                boutiqueData: BoutiqueData,
                                onDelete: (String id) {
                                  setState(() {
                                    modelCommandess = modelCommandess
                                        .where(
                                            (commandes) => commandes.id != id)
                                        .toList();
                                  });
                                },
                              )
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ),
          );
  }
}
