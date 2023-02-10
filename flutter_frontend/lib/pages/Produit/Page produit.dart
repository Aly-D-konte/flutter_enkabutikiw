import 'package:flutter/material.dart';
import 'package:flutter_frontend/Models/Boutique_data.dart';
import 'package:flutter_frontend/Models/ModelProduit.dart';
import 'package:flutter_frontend/Services/Produit_service.dart';
import 'package:provider/provider.dart';

import 'Produit_affichage.dart';


class ProduitPage extends StatefulWidget {
  const ProduitPage({Key? key}) : super(key: key);

  @override
  State<ProduitPage> createState() => _ProduitPageState();
}

class _ProduitPageState extends State<ProduitPage> {
  List<ModelProduit> modelProduits = [];

  get() async {
    modelProduits = await ProduitServices.getProduit();
    Provider.of<BoutiqueData>(context, listen: false).modelProduits = modelProduits!;

    setState(() {

    });
  }

  @override
  void initState(){
    super.initState();
    get();
  }

  @override
  Widget build(BuildContext context) {
    return modelProduits == null?
    const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    )

    :Scaffold(
     
        body: Column(
          children: [
            Container(
              color: Colors.amber,
              height: 100,
            ),
            Flexible(
              child: Consumer<BoutiqueData>(
                  builder: (context, boutiqueData, child) {
                    return SingleChildScrollView(
                      child: Wrap(
                        direction: Axis.horizontal,
                        //alignment: WrapAlignment.spaceAround,
                        children: [
                          for(int i = 0; i < modelProduits.length; i++)
                        ProduitAffichage(
                        modelProduit: modelProduits[i],
                        boutiqueData: boutiqueData,
                      )
                      ],
                      ),
                    );
                  }),
            )
          ],
        )
    );
  }
}
