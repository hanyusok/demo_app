/* page_one => "posts_page.dart" '신청내역'  */

import 'package:demo_app/themes/custom_theme.dart';
import 'package:flutter/material.dart';

class PageOne extends StatefulWidget {
  const PageOne({super.key});

  @override
  State<PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 12.0),
                child: Row(mainAxisSize: MainAxisSize.max, children: [
                  Text(
                    '비대면 리스트',
                    // style: CustomTheme.of(context).bodySmall,
                    /* customTheme bodySmall 설정 확인!  */
                  ),
                ]),
              ),
              // Expanded(child: ),
              Text('Page One 신청리스트, 진행경과, 추가, 조회'),
            ],
          )),
      floatingActionButton: FloatingActionButton(
          backgroundColor: CustomTheme.of(context).primaryBackground,
          elevation: 8.0,
          child: Icon(Icons.add_rounded,
              size: 36, color: CustomTheme.of(context).primary),
          onPressed: () {
            /* add modal bottom sheet*/
          }),
    );
  }
}
