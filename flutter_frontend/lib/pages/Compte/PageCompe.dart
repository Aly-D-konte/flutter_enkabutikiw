import 'package:flutter/material.dart';
import 'package:flutter_frontend/pages/Compte/ProfileBody.dart';

class PageCompte extends StatelessWidget {
  const PageCompte({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      
      child: ProfileBody()
    );
  }
}
