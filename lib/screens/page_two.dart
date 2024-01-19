/* page_two => "notifications_page.dart" '알림 메시지'  '수납금액'*/

import 'package:flutter/material.dart';

class PageTwo extends StatefulWidget {
  const PageTwo({super.key});

  @override
  State<PageTwo> createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
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
                    '알림 메시지',
                    // style: CustomTheme.of(context).bodySmall,
                    /* customTheme bodySmall 설정 확인!  */
                  ),
                ]),
              ),
              Text('Page Two 2번페이지, 알림, 수납금액,'),
            ],
          )),
    );
  }
}
