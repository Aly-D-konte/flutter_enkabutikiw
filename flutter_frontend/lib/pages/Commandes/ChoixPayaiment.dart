import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ChoixPayaiment extends StatelessWidget {
  const ChoixPayaiment({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Choisir un mode de payaiment"),
      ),
    ));
  }
}
