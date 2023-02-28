//import 'dart:convert';

//import 'package:http/http.dart' as http;

//class ApiServices {
const String baseUrl = "http://10.0.2.2:8080/api";
const Map<String, String> headers = {
  "content-type": "application/json",
  // "accept": "application/json",
};

var usId;
String? nomuser;
String? prenomuser;
String? emailuser;
/*la partie get
  Future<http.Response> get(String url, Map<String, String> params) async {
    try {
      Uri uri = Uri.parse(_baseUrl + url).replace(queryParameters: params);
      http.Response response = await http.get(uri);
      return response;
    } catch (e) {
      return http.Response({"message": e}.toString(), 400);
    }
  }

//la partie post

  Future<http.Response> post(String url, Map<String, String> body) async {
    try {
      Uri uri = Uri.parse(_baseUrl + url);
      String bodyString = json.encode(body);
      http.Response response = await http.post(uri, headers: headers, body: bodyString );
      return response;
    } catch (e) {
      return http.Response({"message": e}.toString(), 400);
    }
  }

  //la partie modifiée

  Future<http.Response> put(String url, Map<String, String> body) async {
    try {
      Uri uri = Uri.parse(_baseUrl + url);
      String bodyString = json.encode(body);
      http.Response response = await http.put(uri, headers: headers, body: bodyString );
      return response;
    } catch (e) {
      return http.Response({"message": e}.toString(), 400);
    }
  }

  //la partie delete

  Future<http.Response> delete(String url) async {
    try {
      Uri uri = Uri.parse(_baseUrl + url);
      http.Response response = await http.post(uri, headers: headers );
      return response;
    } catch (e) {
      return http.Response({"message": e}.toString(), 400);
    }
  }
}*/
