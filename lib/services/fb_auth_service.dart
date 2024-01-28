// import 'dart:developer';

// import 'dart:html';

// import 'package:demo_app/services/show_otp_dialog.dart';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FbAuthService {
  final FirebaseAuth _auth;
  FbAuthService(this._auth);

  //Email Sign up
  Future<void> signUpWithEmail({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      // 확인 이메일 전송
      if (!context.mounted) return;
      await sendEmailVerify(context);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        if (!context.mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('비밀번호 오류!'),
          duration: Duration(seconds: 3),
        ));
      } else if (e.code == 'email-already-in-use') {
        if (!context.mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('이메일 중복 오류!'),
          duration: Duration(seconds: 3),
        ));
      } else if (e.code == 'invalid-email') {
        if (!context.mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('이메일 형식 오류!'),
          duration: Duration(seconds: 3),
        ));
      }
    }
  }

  // Anonymous sign in
  Future<void> anonymousUserSign(BuildContext context) async {
    try {
      await _auth.signInAnonymously();
    } on FirebaseAuthException catch (e) {
      log(e.message.toString());
    }
  }

  // Google Sign in
  Future<void> googleUserLogin(BuildContext context) async {
    try {
      if (kIsWeb) {
        GoogleAuthProvider googleProvider = GoogleAuthProvider();
        googleProvider
            .addScope('https://wwww.googleapis.com/auth/contacts.readonly');
        await _auth.signInWithPopup(googleProvider);
      } else {
        final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
        final GoogleSignInAuthentication? googleAuth =
            await googleUser?.authentication;

        if (googleAuth?.accessToken != null && googleAuth?.idToken != null) {
          final credential = GoogleAuthProvider.credential(
              accessToken: googleAuth?.accessToken,
              idToken: googleAuth?.idToken);
          UserCredential userCredential =
              await _auth.signInWithCredential(credential);
          if (userCredential.user != null) {
            if (userCredential.additionalUserInfo!.isNewUser) {
              //
            }
          }
        }
      }
    } on FirebaseAuthException catch (e) {
      log(e.message.toString());
    }
  }

  //PHONE SIGN IN
  // Future<void> phoneSignIn(BuildContext context, String phoneNumber) async {
  //   //For Android or Ios
  //   TextEditingController codeController = TextEditingController();
  //   await _auth.verifyPhoneNumber(
  //     phoneNumber: phoneNumber,
  //     verificationCompleted: (PhoneAuthCredential credential) async {
  //       await _auth.signInWithCredential(credential);
  //     },
  //     verificationFailed: (e) {
  //       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
  //         content: Text('e.message!'),
  //         duration: Duration(seconds: 3),
  //       ));
  //     },
  //     codeSent: ((String verificationId, int? resendToken) async {
  //       showOTPDialog(
  //           codeController: codeController,
  //           context: context,
  //           onPressed: () async {
  //             PhoneAuthCredential credential = PhoneAuthProvider.credential(
  //                 verificationId: verificationId,
  //                 smsCode: codeController.text.trim());
  //             await _auth.signInWithCredential(credential);
  //             if (!context.mounted) return;
  //             Navigator.of(context).pop();
  //           });
  //     }),
  //     codeAutoRetrievalTimeout: (String verificationId) {
  //       // Auto resolution timed out
  //     },
  //   );
  // }

  //Email Login
  Future<void> loginWithEmail({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      if (!_auth.currentUser!.emailVerified) {
        if (!context.mounted) return;
        await sendEmailVerify(context);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        if (!context.mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('사용자 계정 없음!'),
          duration: Duration(seconds: 3),
        ));
      } else if (e.code == 'invalid-email') {
        if (!context.mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('유효하지 않는 이메일!'),
          duration: Duration(seconds: 3),
        ));
      } else if (e.code == 'wrong-password') {
        if (!context.mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('비밀번호 오류!'),
          duration: Duration(seconds: 3),
        ));
      }
    }
  }

  //Email verification
  Future<void> sendEmailVerify(BuildContext context) async {
    try {
      _auth.currentUser!.sendEmailVerification();
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('인증메일확인!'),
        duration: Duration(seconds: 3),
      ));
    } on FirebaseAuthException catch (e) {
      if (e.code.isNotEmpty) {
        // if (!context.mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('e.code.toString()'),
          duration: Duration(seconds: 3),
        ));
      }
    }
  }
}
