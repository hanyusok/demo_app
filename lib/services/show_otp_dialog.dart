// import 'package:flutter/material.dart';
// // import 'package:firebase_auth/firebase_auth.dart';

// //OTP dialog
// void showOTPDialog({
//   required BuildContext context,
//   required TextEditingController codeController,
//   required VoidCallback onPressed,
// }) {
//   showDialog(  
//       context: context,
//       barrierDismissible: true,
//       builder: (context) => const AlertDialog(
//             title: Text('Enter OTP'),
//             content: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: <Widget>[
//                 TextField(
//                   controller: controller,
//                   obscureText: false,
//                   decoration: InputDecoration(
//                       border: OutlineInputBorder(), labelText: '인증번호'),
//                 )
//               ],
//             ),
//             actions: <Widget>[
//               TextButton(
//                 onPressed: onPressed,
//                 child: Text('Done'),
//               )
//             ],
//           ));
// }
