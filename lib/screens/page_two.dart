/* page_two => "notifications_page.dart" '알림 메시지'  '수납금액'*/

import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PageTwo extends StatefulWidget {
  const PageTwo({super.key});

  @override
  State<PageTwo> createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  final User? user = FirebaseAuth.instance.currentUser;
  void signout() async {
    await FirebaseAuth.instance.signOut();
    log('${user?.uid} : log out!');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 12.0),
                child: Row(mainAxisSize: MainAxisSize.max, children: [
                  Text(
                    '알림 메시지',
                    // style: CustomTheme.of(context).bodySmall,
                    /* customTheme bodySmall 설정 확인!  */
                  ),
                ]),
              ),
              const Text('Page Two 2번페이지, 알림, 수납금액,'),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(
                  0.0,
                  24.0,
                  0.0,
                  0.0,
                ),
                child: ElevatedButton(
                  onPressed: signout,
                  child: const Text(
                    'log out',
                    style: TextStyle(),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
