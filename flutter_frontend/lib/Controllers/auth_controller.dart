import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../Services/globals.dart';

class AuthController {
  static Future<bool> LoginUser(String usernameOrEmail, String password) async {
    Map data = {'usernameOrEmail': usernameOrEmail, 'password': password};
    // const _url = Uri.parse(_baseUrl + '/auth/signin');
    var body = jsonEncode(data);
    var url = Uri.parse(baseUrl + '/auth/signin');
    var response = await http.post(url, body: body, headers: headers);
    print(response.statusCode);
    if (response.statusCode == 200) {
      var loginArr = json.decode(response.body);
      var name = json.decode(response.body);
      var firstname = json.decode(response.body);
      var mail = json.decode(response.body);
      nomuser = name['nom'];
      print(nomuser);
      prenomuser = firstname['prenom'];
      print(prenomuser);
      emailuser = mail['email'];
      print(emailuser);
      usId = loginArr['id'];
      print(loginArr['id']);
      return true;
    } else {
      print(response.body);
      throw ('erreur de connexion');
    }
  }
}
