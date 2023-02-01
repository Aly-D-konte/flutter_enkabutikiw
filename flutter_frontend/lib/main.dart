import 'package:flutter/material.dart';
import 'package:flutter_frontend/Models/Boutique_data.dart';
import 'package:flutter_frontend/pages/Boutique.dart';
import 'package:flutter_frontend/pages/DELL.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BoutiqueData>(
      create:(context) => BoutiqueData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromARGB(255, 240, 240, 240),
        ),
        routes: {
          "/": (context) => const pages(),
         // "itemPage": (context) => ItemPage()
        },
      ),
    );
  }
}
