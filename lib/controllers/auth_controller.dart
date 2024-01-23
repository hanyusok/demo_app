// import 'package:flutter/foundation.dart';
// import 'package:flutter/widgets.dart';

// class AuthController extends StatefulWidget {
//   const AuthController({super.key});

//   @override
//   State<AuthController> createState() => _AuthControllerState();
// }

// class _AuthControllerState extends State<AuthController> {
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }

//    FirebaseAuth.instance.authStateChanges().listen((User? user) {
//     if (user == null){
//       log('User is currently signed out!');
//     } else {
//       log('User is signed in!');
//     }
//     })