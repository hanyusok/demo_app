// import 'dart:developer';
// import 'dart:html';
// import 'package:demo_app/services/show_otp_dialog.dart';
import 'dart:developer';
// import 'dart:html';
// import 'package:flutter/foundation.dart';
import 'package:demo_app/screens/profile/profiles_page.dart';
import 'package:demo_app/services/util.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FbAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? get user => _auth.currentUser!;
  UserCredential? userCred;
  //state persistence
  Stream<User?> get authState => _auth.authStateChanges();

  /* Create user by email Sign up */
  Future<void> signUpWithEmail({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (user != null) {
        log('user: ${user!.uid} login successfully.');
      }

      /* 확인 이메일 전송 */
      // ignore: use_build_context_synchronously
      await sendEmailVerify(context);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        log('비밀번호 오류!');
        // ignore: use_build_context_synchronously
        await customSnackBar(context, '비밀번호오류!');
      } else if (e.code == 'email-already-in-use') {
        log('이메일 중복!');
        // ignore: use_build_context_synchronously
        await customSnackBar(context, '이메일 중복');
      } else if (e.code == 'invalid-email') {
        log('이메일 유효하지 않습니다.');
        // ignore: use_build_context_synchronously
        await customSnackBar(context, '이메일 유효하지 않습니다');
      }
    }
  }

  /* Login with email and password */
  Future<void> loginWithEmail({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      userCred = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (userCred?.user != null) {
        log('user: ${userCred?.user?.uid} login successfully.');
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        log('user not found!');
        // ignore: use_build_context_synchronously
        await customSnackBar(context, 'user not found');
      } else if (e.code == 'invalid-email') {
        log('invalid email!');
        // ignore: use_build_context_synchronously
        await customSnackBar(context, 'invalid email');
      } else if (e.code == 'wrong-password') {
        log('wrong password!');
        // ignore: use_build_context_synchronously
        await customSnackBar(context, 'wrong password');
      }
    }
  }

  /* Anonymous login */
  Future<void> anonymousUserSign(BuildContext context) async {
    try {
      await _auth.signInAnonymously();
      // if (!context.mounted) return;
      log('${user!.uid} logged in.');
    } on FirebaseAuthException catch (e) {
      log(e.message.toString());
    }
  }

  Future<void> signInWithGoogle(BuildContext context) async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    await _auth.signInWithCredential(credential).then((value) {
      //go to dashboard
      log('google login success');
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const ProfilesPage()));
    }).onError((error, stackTrace) {
      //error show
      log("error $error");
    });
  }

  /* Email verification */
  Future<void> sendEmailVerify(BuildContext context) async {
    try {
      await _auth.currentUser!.sendEmailVerification();
      // ignore: use_build_context_synchronously
      await customSnackBar(context, '이메일 확인하세요!!!');
    } on FirebaseAuthException catch (e) {
      if (e.code.isNotEmpty) {
        // ignore: use_build_context_synchronously
        await customSnackBar(context, e.message.toString());
      }
    }
  }

  /* log out */
  Future<void> userLogOut() async {
    await _auth.signOut();
    if (user == null) {
      log('user: logout successfully.');
    }
  }
}
