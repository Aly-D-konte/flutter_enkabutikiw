import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PanierAlert extends StatelessWidget {
  const PanierAlert({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.grey,

      //popup pour le panier
      content: Column(
        children: [
          for (int i = 1; i < 4; i++)
            Container(
              height: 110,
              margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  Radio(
                      value: "",
                      groupValue: "",
                      activeColor: Colors.black,
                      onChanged: (index) {}),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Refrigerateur",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                              color: Colors.black),
                        ),
                        const Text(
                          "16 000 FCFA",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.orangeAccent,
                          ),
                        ),
                        //la partie ou on va ajouté ou enlever une quantite
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                  color: Colors.orangeAccent,
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      bottomLeft: Radius.circular(10)),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 1,
                                        blurRadius: 5)
                                  ]),
                              child: const Icon(
                                CupertinoIcons.minus,
                              ),
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: const Text(
                                "01",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: Colors.orangeAccent,
                                  borderRadius: const BorderRadius.only(
                                      topRight: Radius.circular(10),
                                      bottomRight: Radius.circular(10)),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 1,
                                        blurRadius: 10)
                                  ]),
                              child: const Icon(
                                CupertinoIcons.plus,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  const Spacer(),
                  Container(
                    height: 70,
                    width: 70,
                    margin: const EdgeInsets.only(right: 5),
                    child: Image.asset(
                      "assets/images/images2.jpg",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 3),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Icon(Icons.delete, color: Colors.red),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.orangeAccent,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2),
                  child: Text(
                    "Ajouter un code coupon",
                    style: TextStyle(
                      color: Color(0XFF4C53A5),
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            height: 150,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Total:",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.normal),
                    ),
                    Text(
                      "48 000 FCFA",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.normal),
                    )
                  ],
                ),
                Container(
                  width: 700,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(20)),
                  child: const Text(
                    "Passer la commande",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
