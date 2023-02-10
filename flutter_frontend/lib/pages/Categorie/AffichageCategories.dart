import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_frontend/Models/Boutique_data.dart';
import 'package:flutter_frontend/Models/ModelCategorie.dart';

class AffichageCategories extends StatelessWidget {
  const AffichageCategories(
      {Key? key, required this.modelCategorie, required this.boutiqueData})
      : super(key: key);
  final ModelCategorie modelCategorie;
  final BoutiqueData boutiqueData;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Row(
          children: [
            Expanded(
              child: Container(
                child: Card(
                  child: Column(
                    children: [
                      Text(modelCategorie.nom),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
