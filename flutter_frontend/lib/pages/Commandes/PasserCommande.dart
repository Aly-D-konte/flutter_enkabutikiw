import 'package:flutter/material.dart';
import 'package:flutter_frontend/pages/Commandes/CommandeState.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';

class PasserCommande extends StatelessWidget {
  PasserCommande({super.key});

  final firstNameController = TextEditingController();

  final lastNameController = TextEditingController();

  final addresseController = TextEditingController();

  final phoneController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  var commandeState = Get.put(CommandeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text('Passer la commande'),
          ),
          body: Form(
            key: formKey,
            child: ListView(
              children: <Widget>[
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                              child: TextFormField(
                            controller: firstNameController,
                            validator: ValidationBuilder(
                                    requiredMessage:
                                        "Le prenom est obligatoire")
                                .build(),
                            decoration: const InputDecoration(
                                hintText: "Votre prenom",
                                label: Text("Prénom"),
                                border: OutlineInputBorder()),
                          )),
                          const SizedBox(
                            width: 8,
                          ),
                          Expanded(
                              child: TextFormField(
                            controller: lastNameController,
                            validator: ValidationBuilder(
                                    requiredMessage:
                                        "Votre nom est obligatoire")
                                .build(),
                            decoration: const InputDecoration(
                                hintText: "Nom",
                                label: Text("Nom"),
                                border: OutlineInputBorder()),
                          ))
                        ],
                      ),
                      // const SizedBox(
                      //   height: 4,
                      // ),
                    ],
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                              child: TextFormField(
                            controller: addresseController,
                            validator: ValidationBuilder(
                                    requiredMessage:
                                        "L'adresse est obligatoire")
                                .build(),
                            decoration: const InputDecoration(
                                hintText: "Votre adresse",
                                label: Text("Adresse de livraison"),
                                border: OutlineInputBorder()),
                          )),
                          SizedBox(
                            width: 8,
                          ),
                          Expanded(
                              child: TextFormField(
                            controller: phoneController,
                            validator: ValidationBuilder(
                                    requiredMessage:
                                        "Votre numero de telephone est obligatoire")
                                .build(),
                            decoration: InputDecoration(
                                hintText: "Telephone",
                                label: Text("Téléphone"),
                                border: OutlineInputBorder()),
                          ))
                        ],
                      ),
                    ],
                  ),
                ),
                Obx(
                  () => Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.account_balance_wallet_sharp,
                            ),
                            Text(
                              "Choisir un mode paiment",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 17),
                            ),
                          ],
                        ),
                        RadioListTile<String>(
                            title: const Text('Payer à la livraison'),
                            value: "CODE",
                            groupValue: commandeState.paymentSelected.value,
                            onChanged: (String? val) {
                              commandeState.paymentSelected.value = val!;
                            }),
                        RadioListTile<String>(
                            title: const Text('Orange money'),
                            value: "MONEY",
                            groupValue: commandeState.paymentSelected.value,
                            onChanged: (String? val) {
                              commandeState.paymentSelected.value = val!;
                            }),
                        RadioListTile<String>(
                            title: const Text('Carte de credit'),
                            value: "CARTE",
                            groupValue: commandeState.paymentSelected.value,
                            onChanged: (String? val) {
                              commandeState.paymentSelected.value = val!;
                            }),
                      ],
                    ),
                  ),
                ),
                Spacer(),
                Spacer(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      child: ElevatedButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.orange,
                        ),
                        child: Text(
                          "Annuler",
                          style: TextStyle(color: Colors.black),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                    Container(
                      child: ElevatedButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.orange,
                        ),
                        child: Text(
                          "Passer la commande",
                          style: TextStyle(color: Colors.black54),
                        ),
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            print('OK');
                          }
                        },
                      ),
                    ),
                  ],
                ),
                
              ],
            ),
          )),
    );
  }
}
