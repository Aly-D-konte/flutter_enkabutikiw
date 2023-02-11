// import 'package:flutter/material.dart';
// import 'package:flutter_frontend/Models/Boutique_data.dart';
// import 'package:flutter_frontend/Models/ModelProduit.dart';
// import 'package:flutter_frontend/Services/Produit_service.dart';
// import 'package:flutter_frontend/pages/Produit/DetailProduit_affichage.dart';
// import 'package:provider/provider.dart';

// import 'Produit_affichage.dart';

// class DetailProduitPage extends StatefulWidget {
//   const DetailProduitPage({Key? key, required ModelProduit modelProduit, required BoutiqueData boutiqueData}) : super(key: key);

//   @override
//   State<DetailProduitPage> createState() => _DetailProduitPageState();
// }

// class _DetailProduitPageState extends State<DetailProduitPage> {
//   List<ModelProduit> modelProduits = [];

//   get() async {
//     modelProduits = await ProduitServices.getProduit();
//     Provider.of<BoutiqueData>(context, listen: false).modelProduits = modelProduits!;

//     setState(() {});
//   }

//   @override
//   void initState() {
//     super.initState();
//     get();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return modelProduits == null
//         ? const Scaffold(
//             body: Center(
//               child: CircularProgressIndicator(),
//             ),
//           )
//         : Scaffold(
//             body: Column(
//             children: [
//               Container(
//                 color: Colors.amber,
//                 height: 100,
//               ),
//               Flexible(
//                 child: Consumer<BoutiqueData>(
//                     builder: (context, boutiqueData, child) {
//                   return SingleChildScrollView(
//                     child: Wrap(
//                       direction: Axis.horizontal,
//                       //alignment: WrapAlignment.spaceAround,
//                       children: [
//                         // for (int i = 0; i < modelProduits.length; i++)
//                         //   DetailProduit(
//                         //     modelProduit: modelProduits[i], boutiqueData: boutiqueData,
//                         //   )
//                       ],
//                     ),
//                   );
//                 }),
//               )
//             ],
//           ));
//   }
// }
