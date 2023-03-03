// import 'package:flutter/material.dart';
// import 'package:flutter_appauth/flutter_appauth.dart';

// class OAuth2LoginPage extends StatefulWidget {
//   @override
//   _OAuth2LoginPageState createState() => _OAuth2LoginPageState();
// }

// class _OAuth2LoginPageState extends State<OAuth2LoginPage> {
//   final FlutterAppAuth appAuth = FlutterAppAuth();

//   AuthorizationTokenResponse? _tokenResponse;

//   Future<void> _authorize() async {
//     try {
//       final AuthorizationTokenResponse? result =
//           await appAuth.authorizeAndExchangeCode(
//         AuthorizationTokenRequest(
//           '706535802123-qiaso2ta3o4bvaptduadfn1pbi4cgohe.apps.googleusercontent.com',
//           'your-redirect-uri',
//           issuer: 'https://your-issuer.com',
//           discoveryUrl:
//               'https://your-issuer.com/.well-known/openid-configuration',
//           clientSecret: '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',
//           scopes: ['openid', 'profile', 'email'],
//           promptValues: ['login'],
//         ),
//       );
//       setState(() {
//         _tokenResponse = result;
//       });
//     } catch (e) {
//       print('Error authorizing with OAuth 2.0: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('OAuth 2.0 Login'),
//       ),
//       body: Center(
//         child: _tokenResponse == null
//             ? ElevatedButton(
//                 onPressed: _authorize,
//                 child: Text('Log in with OAuth 2.0'),
//               )
//             : Text('Logged in with OAuth 2.0'),
//       ),
//     );
//   }
// }
