import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ProduitQuantiteController extends GetxController {
  var nombreQuantite = 1.obs;
  //pour que ça increment si on clique
  void deleteQuantite() {
    if(nombreQuantite.value > 1){
    nombreQuantite.value--;

    }
  }

  //pour que ça de-increment si on clique
  void addQuantite() {
    nombreQuantite.value++;
  }
} 
