import 'package:flutter/material.dart';
import 'package:flutter_frontend/Controllers/auth_controller.dart';
import 'package:flutter_frontend/pages/Boutique/Boutique.dart';
import 'package:flutter_frontend/pages/Menu/menuBottom.dart';
import 'package:http/http.dart';

import '../je sais.dart';

class LoginWidget extends StatefulWidget {
  LoginWidget({Key? key}) : super(key: key);

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  AuthController authController = AuthController();
  late String query;
  bool notVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        body: Container(
          // constraints: BoxConstraints(
          //   maxHeight: MediaQuery.of(context).size.height,
          //   maxWidth: MediaQuery.of(context).size.width,
          // ),
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                    //height: 100,
                    // color: Colors.amber,
                    ),
              ),
              Expanded(
                flex: 6,
                child: Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50)),
                      color: Colors.white,
                    ),
                    child: SingleChildScrollView(
                      child: Flexible(
                        child: Column(
                          //partie image
                          children: [
                            SizedBox(
                              height: 50,
                            ),
                            //Partie image (en cas si l'image ne marche on va mettre le lien de l'image dans pubspec.yaml
                            Image.asset(
                              "assets/images/lo.png",
                              width: 200,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: SizedBox(
                                height: 50,
                                child: TextFormField(
                                  //declaration du controler username
                                  controller: usernameController,
                                  decoration: const InputDecoration(
                                    hintText: 'usernameOrEmail',
                                    enabledBorder: OutlineInputBorder(),
                                    focusedBorder: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                            ),
                            //partie password
                            SizedBox(
                              height: 30,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: SizedBox(
                                height: 50,
                                child: TextFormField(
                                  //pour cacher la visibilité d'un text
                                  obscureText: true,
                                  //declaration du controler username
                                  controller: passwordController,
                                  decoration: InputDecoration(
                                    //Le button qui gere la visibilité d'un text
                                    suffixIcon: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            notVisible = !notVisible;
                                          });
                                        },
                                        icon: Icon(notVisible == true
                                            ? Icons.visibility_off_outlined
                                            : Icons.visibility_outlined),
                                        style: ButtonStyle()),
                                    hintText: 'password',
                                    enabledBorder: OutlineInputBorder(),
                                    focusedBorder: OutlineInputBorder(),
                                  ),
                                  validator: (String? password) {
                                    if (password == null || password.isEmpty) {
                                      return 'svp veuillez saisir password';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(height: 40),
                            // ElevatedButton(
                            //     style: const ButtonStyle(
                            //         backgroundColor: MaterialStatePropertyAll(
                            //             Colors.orangeAccent)),
                            //     onPressed: () async {
                            //       var response = await authController.LoginUser(
                            //           usernameController.text,
                            //           passwordController.text);

                            //       Navigator.push(
                            //         context,
                            //         MaterialPageRoute(
                            //             builder: (context) => Homepage()),
                            //       );
                            //     },
                            //     child: const Text(
                            //       'Connecter',
                            //       style: TextStyle(
                            //           backgroundColor: Colors.orangeAccent,
                            //           fontSize: 23),
                            //     ))
                            ElevatedButton(
                              style: const ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                      Colors.orangeAccent)),
                              onPressed: () async {
                                if (await AuthController.LoginUser(
                                    usernameController.text,
                                    passwordController.text)) {
                                  // Les informations de connexion sont valides
                                  print('fff');
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Homepage()),
                                  );
                                } else {
                                  // Les informations de connexion sont incorrectes
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text("Erreur de connexion"),
                                        content: Text(
                                            "Le nom d'utilisateur ou le mot de passe est incorrect."),
                                        actions: [
                                          TextButton(
                                            child: Text("OK"),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                }
                              },
                              child: const Text(
                                'Connecter',
                                style: TextStyle(
                                    backgroundColor: Colors.orangeAccent,
                                    fontSize: 23),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
