import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../Services/globals.dart';

class AuthController{

  Future<http.Response> LoginUser(String usernameOrEmail, String password) async{
    Map data = {
      'usernameOrEmail': usernameOrEmail,
      'password' : password
    };
   // const _url = Uri.parse(_baseUrl + '/auth/signin');
    var body = jsonEncode(data);
    var  url = Uri.parse(baseUrl + '/auth/signin') ;
    var response = await http.post(url, body: body, headers: headers);
    if(response.statusCode == 200){
      var loginArr = json.decode(response.body);

      print(loginArr);
    } else{
      print(response.body);
    }
    return response;
  }
}
