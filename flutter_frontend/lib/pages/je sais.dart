import 'package:flutter/material.dart';
import 'package:flutter_frontend/pages/Auhentification/Login.dart';

class Example extends StatelessWidget {
  const Example({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: 200,
          color: Colors.amber,
          child: Center(
            child: InkWell(
                child: const Text("fghjkl"),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => LoginWidget()));
                }),
          )),
    );
  }
}
