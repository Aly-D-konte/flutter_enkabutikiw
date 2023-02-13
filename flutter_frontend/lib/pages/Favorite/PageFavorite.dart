import 'package:flutter/material.dart';
import 'package:flutter_frontend/Controllers/Produit/FavoriteController.dart';
import 'package:get/get.dart';

class PageFavorite extends StatelessWidget {
  PageFavorite({Key? key}) : super(key: key);

  FavoriteController favoriteController = Get.put(FavoriteController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              color: Colors.amber,
              height: 200,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    
                    children: [
                      Text(favoriteController.nombreProduit.value.toString()),
                      
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
