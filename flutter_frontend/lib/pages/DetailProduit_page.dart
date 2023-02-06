import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Models/ModelProduit.dart';

class DetailProduit extends StatelessWidget {
   DetailProduit ({super.key, required this.modelProduit});
final ModelProduit modelProduit;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFEDECF2),
      body: ListView(
        children: [
         // const HomeAppBar(),
          Card(
            shadowColor: Colors.black,
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(50)),
              height: 600,
              child: Column(
                children: [
                  //l'image et la description
                  Padding(
                    padding: const EdgeInsets.all(2),
                    child: Row(
                      children: [
                        //container contenant l'image
                        Container(
                          // color: Colors.red,

                          width: MediaQuery.of(context).size.width * .40,
                          height: 200,

                          child: Container(
                            
                            child: Expanded(
                              
                              child: Hero(
                                
                                tag: modelProduit.id,
                                child:  CachedNetworkImage(
                                  fit: BoxFit.cover,
                                  height: 120,
                                  width: 120,
                                  imageUrl: modelProduit.image,
                                  placeholder: (context, url) => new CircularProgressIndicator(),
                                  errorWidget: (context, url, error) => new Icon(Icons.electric_rickshaw_sharp),
                                ),
                                // child: Image.asset(
                                //   modelProduit.image,
                                //   width: 200,
                                //   fit: BoxFit.cover,
                                // ),
                              ),
                            ),
                          ),
                        ),
                        //container contenant la description
                        Expanded(
                          child: Container(
                            //  color: Colors.amber,
                            height: 200,
                            child: Column(
                              children: [
                                // le titre et licon favorite
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 50,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        'Description',
                                        style: TextStyle(fontSize: 24),
                                      ),
                                      IconButton(
                                          onPressed: () {},
                                          icon: const Icon(
                                            Icons.favorite,
                                            color: Colors.red,
                                          ))
                                    ],
                                  ),
                                ),
                                // la description en elle meme
                                 Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                      modelProduit.description
                                ),)
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  //la partie d'ajout de quantite
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            color: Colors.orangeAccent,
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10)),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 5)
                            ]),
                        child: const Icon(
                          CupertinoIcons.minus,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        child: const Text(
                          "01",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.normal),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.orangeAccent,
                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomRight: Radius.circular(10)),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 10)
                            ]),
                        child: const Icon(
                          CupertinoIcons.plus,
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children:  [
                                    Text(
                                      "Bouique",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 24),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text("hhj")
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children:  [
                                    Text(
                                      "Categorie",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 24),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text("tfukyy")
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children:  [
                                    Text(
                                      "Type",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 24),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                   Text(
                                      modelProduit.type
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children:  [
                                    Text(
                                      "Marque",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 24),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(modelProduit.marque)
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children:  [
                                    Text(
                                      "Modéle",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 24),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(modelProduit.modele)
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children:  [
                                    Text(
                                      "Capacité",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 24),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(modelProduit.capacite)
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
