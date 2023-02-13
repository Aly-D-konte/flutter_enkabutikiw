import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_frontend/Models/ModelCategorie.dart';

import '../../Models/Boutique_data.dart';

class Categorie extends StatelessWidget {
  const Categorie({
    super.key,
    required this.boutiqueData,
    required this.modelCategorie,
  });

  final ModelCategorie modelCategorie;
  final BoutiqueData boutiqueData;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Row(
      children: [
        Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(40),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  child: CachedNetworkImage(
                    //fit: BoxFit.cover,
                    height: 120,
                    width: 120,
                    imageUrl: modelCategorie.image,
                    placeholder: (context, url) =>
                        new CircularProgressIndicator(),
                    errorWidget: (context, url, error) =>
                        new Icon(Icons.electric_rickshaw_sharp),
                  ),
                ),
                Text(
                  modelCategorie.nom,
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 15,
                      color: Colors.black),
                ),
              ],
            )
            ),
      ],
    )
    );
  }
}
