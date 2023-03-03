// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../../Services/OauthService.dart';

// class LoginPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar
// (title: Text('Login')),
// body: Center(
// child: ElevatedButton(
// child: Text('Login with Google'),
// onPressed: () async {
// final Map<String, dynamic> result =
// await AuthService
// .authorize();
// if (result['accessToken'] != null) {
// Navigator.of(context).pushNamed('/home');
// }
// },
// ),
// ),
// );
// }
// }