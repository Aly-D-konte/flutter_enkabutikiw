import 'package:flutter/material.dart';
import 'package:flutter_frontend/Controllers/auth_controller.dart';
import 'package:flutter_frontend/pages/Boutique.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController usernameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    AuthController authController = AuthController();

    return Scaffold(
      backgroundColor: Colors.blue,
      body: Padding(
        padding: const EdgeInsets.only(top: 200),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(50), topRight: Radius.circular(50)),
            color: Colors.white,
          ),

          child: Column(
            //partie image
            children:[
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
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  height: 50,
                  child: TextFormField(

                    //declaration du controler username
                    controller: usernameController,
                    decoration: const  InputDecoration(
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
                padding: const EdgeInsets.symmetric(horizontal: 20),
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
                  ),
                ),
              ),
              SizedBox(
                height: 40
              ),
              ElevatedButton(

                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orangeAccent,
                  minimumSize: Size(200, 50),

                ),
                  onPressed: (){
                  authController.LoginUser(usernameController.text, passwordController.text);
                  //Navigator.push(context, MaterialPageRoute(builder: (context)=>PageBoutique()));
                  }, child:  Text('Connecter',
              style: TextStyle(
                backgroundColor: Colors.orangeAccent,
                fontSize: 23
              ),
              ))
            ],

          ),
        ),
      )
    );
  }
}
