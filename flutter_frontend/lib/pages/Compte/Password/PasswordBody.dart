import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'CodeValidation.dart';

class PasswordBody extends StatelessWidget {
  const PasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      // height: 100,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            children: [
              const SizedBox(height: 100),
              const Text(
                "Mot de passe oublié",
                style: TextStyle(
                  fontSize: 28,
                  color: Colors.red,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "Entrer votre email pour vous envoyez le code de renitialisation de votre mot de passe ",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                ),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                child: TextFormField(
                  decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Entrer votre email'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextButton(
                    style: TextButton.styleFrom(
                      minimumSize: const Size(180, 10),
                      padding: const EdgeInsets.all(10),
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => CodeValidation()));
                    },
                    child: const Text(
                      "Envoyer",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
