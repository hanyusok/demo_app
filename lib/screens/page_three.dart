/* page_three => "qrcode_generator_page.dart" 'qr코드 생성'  */

import 'package:flutter/material.dart';

class PageThree extends StatefulWidget {
  const PageThree({super.key});

  @override
  State<PageThree> createState() => _PageThreeState();
}

class _PageThreeState extends State<PageThree> {
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
                    'qrcode 생성',
                    // style: CustomTheme.of(context).bodySmall,
                    /* customTheme bodySmall 설정 확인!  */
                  ),
                ]),
              ),
              // Expanded(child: ),
              Text('qr코드 생성해서, 접수 barcode reader에서 등록'),
            ],
          )),
    );
  }
}
