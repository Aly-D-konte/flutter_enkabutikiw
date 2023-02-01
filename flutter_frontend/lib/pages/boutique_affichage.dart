import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_frontend/Models/Boutique_data.dart';
import 'package:flutter_frontend/pages/Boutique.dart';

import '../Models/boutique.dart';

class AffichageBoutique extends StatelessWidget {
  const AffichageBoutique({super.key, required this.boutiqueData, required this.modelBoutiques,  });

  final ModelBoutiques modelBoutiques;
  final BoutiqueData boutiqueData;

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
       child:  Column(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
           Row(
             children: [
               Container(
                 width: MediaQuery.of(context).size.width * .45,
                 child: Card(
                   shadowColor: Colors.black,
                   elevation: 5,
                   child: Container(
                       padding: const EdgeInsets.all(2),
                       decoration: BoxDecoration(
                           color: Colors.white,
                           borderRadius: BorderRadius.circular(15)),
                       height: 200,
                       width: MediaQuery.of(context).size.width * .45,
                       child: Column(
                         children: [
                           Container(
                             height: 100,
                             child: Image.asset(
                               "assets/images/images2.jpg",
                               width: 200,
                               fit: BoxFit.cover,
                             ),
                           ),
                            Text(
                               modelBoutiques.description),
                           const SizedBox(
                             height: 10,
                           ),
                           Row(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: const [
                               Icon(
                                 CupertinoIcons.star,
                                 size: 20,
                               ),
                               SizedBox(
                                 width: 5,
                               ),
                               Icon(
                                 CupertinoIcons.star,
                                 size: 20,
                               ),
                               SizedBox(
                                 width: 5,
                               ),
                               Icon(
                                 CupertinoIcons.star,
                                 size: 20,
                               ),
                               SizedBox(
                                 width: 5,
                               ),
                               Icon(
                                 CupertinoIcons.star,
                                 size: 20,
                               ),
                               SizedBox(
                                 width: 5,
                               ),
                               Icon(
                                 CupertinoIcons.star,
                                 size: 20,
                               ),
                             ],
                           )
                         ],
                       )),
                 ),
               ),
             ],
           ),
         ],
       ),
    );
  }
}
