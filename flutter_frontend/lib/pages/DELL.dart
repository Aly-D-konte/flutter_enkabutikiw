import 'package:flutter/material.dart';
import 'package:flutter_frontend/pages/Page%20produit.dart';
import 'package:flutter_frontend/pages/PageCategorie.dart';


import 'Boutique_page.dart';

class pages extends StatelessWidget {
  const pages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Center(
        child: ElevatedButton(
          child: Text("cvbn,;,nbvbn,,nbvcvb"),
          onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (_)=> PageCategorie()));
          },
        ),
      ),
    );
  }
}
