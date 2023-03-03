// import 'dart:async';
// import 'package:flutter_appauth/flutter_appauth.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// import '../pages/Auhentification/constantes.dart';

// class AuthService {
//   static final FlutterAppAuth _appAuth = FlutterAppAuth();
//   static final FlutterSecureStorage _secureStorage =  FlutterSecureStorage();

//   /// Vérifie si l'utilisateur est déjà connecté en vérifiant la présence d'un jeton d'accès.
//   static Future<bool> isAuthorized() async {
//     return await _secureStorage.read(key: 'accessToken') != null;
//   }

//   /// Effectue le processus d'authentification avec le fournisseur d'identité.
//   /// Si l'authentification réussit, stocke les jetons d'accès et renvoie un map contenant les jetons d'accès.
//   static Future<Map<String, dynamic>> authorize() async {
//     final AuthorizationTokenResponse? result =
//         await _appAuth.authorizeAndExchangeCode(
//       AuthorizationTokenRequest(
//         Constants.clientId,
//         Constants.redirectUri,
//         scopes: <String>[Constants.scope],
//         serviceConfiguration: AuthorizationServiceConfiguration(
//       Constants.authority,
//       Constants.discoveryUrl,
//     ),bl
//         additionalParameters: <String, dynamic>{'prompt': 'consent'},
//       ),
//     );

//     await _secureStorage.write(key: 'accessToken', value: result?.accessToken);
//     await _secureStorage.write(key: 'idToken', value: result?.idToken);
//     await _secureStorage.write(
//         key: 'refreshToken', value: result?.refreshToken);

//     return {'accessToken': result?.accessToken, 'idToken': result?.idToken};
//   }

//   /// Supprime tous les jetons d'accès stockés.
//   static Future<void> logout() async {
//     await _secureStorage.deleteAll();
//   }

//   /// Renvoie un en-tête d'autorisation contenant le jeton d'accès stocké.
//   static Future<Map<String, String>> getAuthorizationHeader() async {
//     final String? accessToken = await _secureStorage.read(key: 'accessToken');

//     return {'Authorization': 'Bearer $accessToken'};
//   }
// }
