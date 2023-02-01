import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Models/Boutique_data.dart';
import '../Models/boutique.dart';
import '../Services/database_services.dart';
import 'boutique_affichage.dart';

class PageBoutique extends StatefulWidget {
  const PageBoutique({super.key});

  @override
  State<PageBoutique> createState() => _PageBoutiqueState();
}

class _PageBoutiqueState extends State<PageBoutique> {
  List<ModelBoutiques>? modelboutiques;

//La methode get

  getBoutiques() async {
    modelboutiques = await DatabaseServices.getBoutiques();
    Provider.of<BoutiqueData>(context, listen: false).modelboutiques = modelboutiques!;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getBoutiques();
  }

  @override
  Widget build(BuildContext context) {
    return modelboutiques == null?
         const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    )
        : Scaffold(
      appBar: AppBar(
        title: Text(
          'Boutiques  (${Provider.of<BoutiqueData>(context).modelboutiques.length})',
        ),
        centerTitle: true,
        backgroundColor: Colors.amberAccent,
      ),
        body: Column(
          children: [
            Container(
              height: 200,
              color: Colors.yellow,
            ),
            const SizedBox(
              height: 20,
            ),
            
             Consumer<BoutiqueData>(builder: (context, boutiqueData, child) {
               return ListView.builder(
                   itemCount: boutiqueData.modelboutiques.length,
                  itemBuilder: (context, index) {
                     ModelBoutiques boutique = boutiqueData.modelboutiques[index];
                    return AffichageBoutique(
                       modelBoutiques: boutique,
                      boutiqueData: boutiqueData,
                    );
                  });
             })
          ],
        ));
  }
}
