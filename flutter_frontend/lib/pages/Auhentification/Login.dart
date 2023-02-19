import 'package:flutter/material.dart';
import 'package:flutter_frontend/Controllers/auth_controller.dart';
import 'package:flutter_frontend/pages/Boutique/Boutique.dart';
import 'package:flutter_frontend/pages/Menu/menuBottom.dart';
import 'package:http/http.dart';

import '../je sais.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController usernameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    AuthController authController = AuthController();

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
                                  //declaration du controler username
                                  controller: passwordController,
                                  decoration: const InputDecoration(
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
                            ElevatedButton(
                                style: const ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(
                                        Colors.orangeAccent)),
                                onPressed: () async {
                                  var response = await authController.LoginUser(
                                      usernameController.text,
                                      passwordController.text);

                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Homepage()),
                                  );
                                },
                                child: const Text(
                                  'Connecter',
                                  style: TextStyle(
                                      backgroundColor: Colors.orangeAccent,
                                      fontSize: 23),
                                ))
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
