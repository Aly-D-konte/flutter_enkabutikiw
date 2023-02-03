import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_frontend/Models/Boutique_data.dart';
import 'package:provider/provider.dart';

import '../Models/boutique.dart';
import '../Services/Boutique_services.dart';
import 'boutique_affichage.dart';

class PageBoutiques extends StatefulWidget {
  const PageBoutiques({Key? key}) : super(key: key);

  @override
  State<PageBoutiques> createState() => _PageBoutiquesState();
}

class _PageBoutiquesState extends State<PageBoutiques> {
  List<ModelBoutiques>? modelboutiques;

  getBoutique() async{
    modelboutiques = await DatabaseServices.getBoutiques();
    Provider.of<BoutiqueData>(context, listen: false).modelboutiques = modelboutiques!;

    setState(() {

    });
  }

  @override
  void initState(){
    super.initState();
    getBoutique();
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
            'Boutiques (${Provider.of<BoutiqueData>(context).modelboutiques.length}) '
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Container(
              color: Colors.amber,
              height: 100,
            ),
            Flexible(
              child: Consumer<BoutiqueData>(
                  builder: (context, boutiqueData, child) {
                return ListView.builder(
                    itemCount: boutiqueData.modelboutiques.length,
                    itemBuilder: (context, index) {
                      ModelBoutiques modelBoutiques = boutiqueData.modelboutiques[index];
                      return AffichageBoutique(
                        modelBoutiques: modelBoutiques,
                        boutiqueData: boutiqueData,
                      );
                    });
              }),
            )
          ],
        )
    );
  }
}
