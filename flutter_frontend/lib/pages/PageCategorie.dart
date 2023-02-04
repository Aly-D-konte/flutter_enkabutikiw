import 'package:flutter/material.dart';
import 'package:flutter_frontend/Models/ModelCategorie.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

import '../Models/Boutique_data.dart';
import '../Services/Categorie_services.dart';
import 'CategorieAffichage.dart';


class PageCategorie extends StatefulWidget {
  const PageCategorie({Key? key}) : super(key: key);

  @override
  State<PageCategorie> createState() => _PageCategorieState();
}

class _PageCategorieState extends State<PageCategorie> {
  List<ModelCategorie> modelCategories = [];

  getCategorie() async {
    modelCategories = await CategorieServices.getCategorie();
    Provider.of<BoutiqueData>(context, listen: false).modelCategories = modelCategories!;

    setState(() {

    });
  }

  @override
  void initState(){
    super.initState();
    getCategorie();
  }

  @override
  Widget build(BuildContext context) {
    return modelCategories == null?
    const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    )

        :Scaffold(
        appBar: AppBar(
          title: Text(
              'Categorie (${Provider.of<BoutiqueData>(context).modelCategories.length}) '
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
                        itemCount: boutiqueData.modelCategories.length,
                        itemBuilder: (context, index) {
                          ModelCategorie modelCategories = boutiqueData.modelCategories[index];
                          return AffichageCategorie(
                            modelCategorie: modelCategories,
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
