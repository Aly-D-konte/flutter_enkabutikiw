import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:form_validator/form_validator.dart';

class Commande extends StatelessWidget {
  Commande({super.key});
  final firstNameController = TextEditingController();

  final lastNameController = TextEditingController();

  final addresseController = TextEditingController();

  final phoneController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Passer la commande'),
        ),
        body: ListView(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: TextFormField(
                        controller: firstNameController,
                        validator: ValidationBuilder(
                                requiredMessage: "Le prenom est obligatoire")
                            .build(),
                        decoration: InputDecoration(
                            hintText: "Votre prenom",
                            label: Text("Prénom"),
                            border: OutlineInputBorder()),
                      )),
                      SizedBox(
                        width: 8,
                      ),
                      Expanded(
                          child: TextFormField(
                        controller: lastNameController,
                        validator: ValidationBuilder(
                                requiredMessage: "Votre nom est obligatoire")
                            .build(),
                        decoration: InputDecoration(
                            hintText: "Nom",
                            label: Text("Nom"),
                            border: OutlineInputBorder()),
                      ))
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: TextFormField(
                        controller: firstNameController,
                        validator: ValidationBuilder(
                                requiredMessage: "Le prenom est obligatoire")
                            .build(),
                        decoration: InputDecoration(
                            hintText: "Votre prenom",
                            label: Text("Prénom"),
                            border: OutlineInputBorder()),
                      )),
                      SizedBox(
                        width: 8,
                      ),
                      Expanded(
                          child: TextFormField(
                        controller: lastNameController,
                        validator: ValidationBuilder(
                                requiredMessage: "Votre nom est obligatoire")
                            .build(),
                        decoration: InputDecoration(
                            hintText: "Nom",
                            label: Text("Nom"),
                            border: OutlineInputBorder()),
                      ))
                    ],
                  ),
                ],
              ),
            ),
            Spacer(),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                child: Text("Passer la commande"),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    print('OK');
                  }
                },
              ),
            ),
            ListTile(
              title: Text('Deuxième élément'),
            ),
            ListTile(
              title: Text('Troisième élément'),
            ),
            // ...Ajoutez autant d'éléments que vous le souhaitez
          ],
        ),
      ),
    );
  }
}
