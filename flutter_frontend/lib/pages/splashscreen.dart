import 'package:flutter/material.dart';

import 'Auhentification/Login.dart';
import 'Commandes/PageCommande.dart';

class pages extends StatelessWidget {
  const pages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueAccent,
      child: Center(
        child: ElevatedButton(
          child: const Text("Commencer"),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => PageCommande()));
          },
        ),
      ),
    );
  }
}
