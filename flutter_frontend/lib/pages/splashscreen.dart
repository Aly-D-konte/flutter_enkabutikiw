import 'package:flutter/material.dart';
import 'package:flutter_frontend/pages/Menu/menuBottom.dart';

import 'Auhentification/Login.dart';

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
                .push(MaterialPageRoute(builder: (_) => LoginWidget()));
          },
        ),
      ),
    );
  }
}
