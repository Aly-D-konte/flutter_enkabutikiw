import 'package:flutter/material.dart';

import 'Menubottom/menu.dart';
import 'Page produit.dart';

class pages extends StatelessWidget {
  const pages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueAccent,
      child: Center(
        child: ElevatedButton(
          child: Text("Commencer"),
          onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (_)=> Homepage()));
          },
        ),
      ),
    );
  }
}
