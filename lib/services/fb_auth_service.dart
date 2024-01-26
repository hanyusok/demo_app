// import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

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

//PHONE SIGN IN
  Future<void> phoneSignIn(BuildContext context, String phoneNumber) async {
    //For Android or Ios
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential);
      },
      verificationFailed: (e) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('e.message!'),
          duration: Duration(seconds: 3),
        ));
      },
      codeSent: ((String verificationId, int? resendToken) async {
        showOTPDialog();
      }),
      codeAutoRetrievalTimeout: '',
    );
  }

  //OTP dialog
  void showOTPDialog({
    required BuildContext context,
    required TextEditingController codeController,
    required VoidCallback onPressed,
  }) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) => const AlertDialog(
              title: Text('Enter OTP'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextField(
                    controller: codeController,
                  )
                ],
              ),
              actions: <Widget>[
                TextButton(onPressed: () {}, child: const Text('Done'))
              ],
            ));
  }

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
