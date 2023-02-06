import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_frontend/Models/Boutique_data.dart';
import 'package:flutter_frontend/Models/ModelProduit.dart';
import 'package:flutter_frontend/pages/DetailProduit_page.dart';

class ProduitAffichage extends StatefulWidget {
  const ProduitAffichage({Key? key, required this.modelProduit, required this.boutiqueData}) : super(key: key);
  final ModelProduit modelProduit;
  final BoutiqueData boutiqueData;

  @override
  State<ProduitAffichage> createState() => _ProduitAffichageState();
}

class _ProduitAffichageState extends State<ProduitAffichage> {
  //Cet controller permet de gerer le scroll

  ScrollController _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Container(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
            margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            width: MediaQuery.of(context).size.width / 2.5,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    const Icon(
                      Icons.favorite_border,
                      color: Colors.red,
                    )
                  ],
                ),
                InkWell(
                  onTap: () {
                    //pour afficher l'element selectionné
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => DetailProduit(modelProduit: widget.modelProduit)
                    ));
                  },
                  // onTap: () {
                  //   //pour afficher l'element selectionné
                  //   Navigator.pushNamed(context, "itemPage");
                  //
                  // },
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      height: 120,
                      width: 120,
                      imageUrl: widget.modelProduit.image,
                      placeholder: (context, url) => new CircularProgressIndicator(),
                      errorWidget: (context, url, error) => new Icon(Icons.electric_rickshaw_sharp),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  alignment: Alignment.center,
                  child:  Text(
                    widget.modelProduit.nom,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                 //Co²
                 Text(  widget.modelProduit.prix.toString() +"\FCFA" ,
                   style: TextStyle(
                     fontSize: 18,
                     fontWeight: FontWeight.normal,
                   ),
                )
              ],
            ),

    );
  }
}
