import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_frontend/Models/ModelCategorie.dart';
import 'package:flutter_frontend/pages/Categorie/AffichageCategories.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

import '../../../Models/Boutique_data.dart';
import '../../../Services/Categorie_services.dart';

class PageCategorie extends StatefulWidget {
  const PageCategorie({Key? key}) : super(key: key);

  @override
  State<PageCategorie> createState() => _PageCategorieState();
}

class _PageCategorieState extends State<PageCategorie> {
  List<ModelCategorie> modelCategories = [];

  getCategorie() async {
    modelCategories = await CategorieServices.getCategorie();
    Provider.of<BoutiqueData>(context, listen: false).modelCategories =
        modelCategories;

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getCategorie();
  }

  @override
  Widget build(BuildContext context) {
    return modelCategories == null
        ? const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : Scaffold(
            // appBar: AppBar(
            //   title: Text(
            //       'Categorie (${Provider.of<BoutiqueData>(context).modelCategories.length}) '
            //   ),
            //   centerTitle: true,
            // ),
            body: Column(
            children: [
              Container(
                color: Colors.amber,
                height: 100,
              ),
              Flexible(
                child: Consumer<BoutiqueData>(
                    builder: (context, boutiqueData, child) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * .4,
                        margin: EdgeInsets.only(top: 25, left: 10),

                        width: MediaQuery.of(context).size.width * .35,
                        //color: Colors.amber,
                        child: Card(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 30,
                                width: double.infinity,
                                color: Colors.black,
                                child: const Center(
                                    child: Text(
                                  "Categorie",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                )),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  //mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    for (int i = 0;
                                        i < modelCategories.length;
                                        i++)
                                      Text(modelCategories[i].nom),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // Container(height: 20,color: Colors.amber,),

                      Container(
                          constraints: BoxConstraints(
                              maxWidth: MediaQuery.of(context).size.width * .6),
                          child: Flexible(
                            child: GridView(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 5,
                                      crossAxisSpacing: 5),
                              children: [
                                for (int i = 0; i < modelCategories.length; i++)
                                  Card(
                                    child: Container(
                                      //height: 20,
                                      //width: 20,
                                      //color: Colors.amber,
                                      child: Column(
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.all(10),
                                            child: CachedNetworkImage(
                                              fit: BoxFit.cover,
                                              height: 60,
                                              //width: 70,
                                              imageUrl:
                                                  modelCategories[i].image,
                                              placeholder: (context, url) =>
                                                  const CircularProgressIndicator(),
                                              errorWidget: (context, url,
                                                      error) =>
                                                  const Icon(Icons
                                                      .electric_rickshaw_sharp),
                                            ),
                                          ),
                                          Text(modelCategories[i].nom),
                                        ],
                                      ),
                                    ),
                                  )
                              ],
                            ),
                          )),
                    ],
                  );
                }),
              )
            ],
          ));
  }
}
