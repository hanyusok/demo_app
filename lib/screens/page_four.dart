/* page_four => "settings_page.dart" '개인설정, 가족추가'  */

// import 'dart:js_util';

import 'dart:developer';

import 'package:demo_app/services/fb_auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PageFour extends StatefulWidget {
  const PageFour({super.key});

  @override
  State<PageFour> createState() => _PageFourState();
}

class _PageFourState extends State<PageFour> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 12.0),
                child: Row(mainAxisSize: MainAxisSize.max, children: [
                  Text(
                    '설정',
                    // style: CustomTheme.of(context).bodySmall,
                    /* customTheme bodySmall 설정 확인!  */
                  ),
                ]),
              ),
              // Expanded(child: ),
              Text('개인, 가족 추가, 약국, 처방전 설정,'),
              ElevatedButton(
                onPressed: signout,
                child: Text(
                  'Log out',
                  style: TextStyle(),
                ),
              )
            ],
          )),
    );
  }
}

Future<void> signout() async {
  User? user = FirebaseAuth.instance.currentUser;
  await FirebaseAuth.instance.signOut();
  log('${user?.uid} : log out!');
}
