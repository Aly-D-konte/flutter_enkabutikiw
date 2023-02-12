import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AjoutPanier extends StatelessWidget {
  const AjoutPanier({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      backgroundColor: Colors.orangeAccent,
                      elevation: 20,
                      minimumSize: Size(150, 40),
                      // shadowColor: Colors.blue
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  onPressed: () {},
                  child: Text(
                    "Ajouter au panier".toUpperCase(),
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.normal),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
