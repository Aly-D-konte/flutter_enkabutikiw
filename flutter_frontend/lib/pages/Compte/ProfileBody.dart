import 'package:flutter/material.dart';
import 'package:flutter_frontend/pages/Compte/profile_menu.dart';
import 'package:flutter_frontend/pages/Compte/profile_photo.dart';

import '../../Models/ModelCommande.dart';
import '../Auhentification/Login.dart';
import '../Commandes/AffichageCommande.dart';
import '../Commandes/PageCommande.dart';
import 'Password/changePassword.dart';

class ProfileBody extends StatelessWidget {
  ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Profile",
          style: TextStyle(fontSize: 30, height: 1.5),
        ),
        const ProfilePic(),
        const SizedBox(
          height: 20,
        ),
        ProfileMenu(
          icon: "assets/images/favorite.png",
          text: "Favorite",
          press: () {},
        ),
        ProfileMenu(
          icon: "assets/images/commande.png",
          text: "Commande",
          press: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => PageCommande()));
          },
        ),
        ProfileMenu(
          icon: "assets/images/commande.png",
          text: "Moribabougou Droit",
          press: () {},
        ),
        ProfileMenu(
          icon: "assets/images/password.png",
          text: "Changer le mot de passe",
          press: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const ChangePassword()));
          },
        ),
        ProfileMenu(
          icon: "assets/images/logout.png",
          text: "Déconnexion",
          press: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => const LoginWidget()));
          },
        ),

        // Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        //   child: TextButton(
        //       style: TextButton.styleFrom(
        //           padding: EdgeInsets.all(20),
        //           backgroundColor: Color(0XFFF5F6F9),
        //           shape: RoundedRectangleBorder(
        //               borderRadius: BorderRadius.circular(15)),
        //           side: BorderSide(color: Color.fromARGB(255, 219, 223, 233))),
        //       onPressed: () {},
        //       child: Row(
        //         children: [
        //           Icon(
        //             Icons.password_outlined,
        //             color: Colors.black54,
        //           ),
        //           SizedBox(
        //             width: 20,
        //           ),
        //           Expanded(
        //               child: Text(
        //             "Changer le mot de passe",
        //             style: Theme.of(context).textTheme.bodyMedium,
        //           ))
        //         ],
        //       )),
        // ),
        // Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        //   child: TextButton(
        //       style: TextButton.styleFrom(
        //           padding: EdgeInsets.all(20),
        //           backgroundColor: Color(0XFFF5F6F9),
        //           shape: RoundedRectangleBorder(
        //               borderRadius: BorderRadius.circular(15)),
        //           side: BorderSide(color: Color.fromARGB(255, 219, 223, 233))),
        //       onPressed: () {},
        //       child: Row(
        //         children: [
        //           Icon(
        //             Icons.logout,
        //             color: Colors.black54,
        //           ),
        //           SizedBox(
        //             width: 20,
        //           ),
        //           Expanded(
        //               child: Text(
        //             "Deconnexion",
        //             style: Theme.of(context).textTheme.bodyMedium,
        //           ))
        //         ],
        //       )),
        // ),
      ],
    );
  }
}
