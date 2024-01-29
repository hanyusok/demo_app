/* page_four => "settings_page.dart" '개인설정, 가족추가'  
 reservation: profilePage
*/

// import 'dart:js_util';

import 'dart:developer';
import 'package:demo_app/themes/custom_radio_button.dart';
// import 'package:demo_app/services/fb_auth_service.dart';
import 'package:demo_app/themes/custom_theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PageFour extends StatefulWidget {
  const PageFour({super.key});

  @override
  State<PageFour> createState() => _PageFourState();
}

class _PageFourState extends State<PageFour> {
  TextEditingController? _yourNameController;
  TextEditingController? _juminController;
  TextEditingController? _phoneController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomTheme.of(context).secondaryBackground,
        automaticallyImplyLeading: false,
        leading: InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            //
          },
          child: Icon(
            Icons.chevron_left_rounded,
            color: CustomTheme.of(context).grayLight,
            size: 32.0,
          ),
        ),
        title: Text(
          '사용자 설정',
          style: CustomTheme.of(context).headlineSmall,
        ),
        // actions: [],
        centerTitle: false,
        elevation: 0.0,
      ),
      body: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: MediaQuery.sizeOf(context).height * 1.0,
            constraints: const BoxConstraints(
              maxWidth: 600.0,
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fitWidth,
                image: Image.asset(
                  'assets/images/page_bg_transparent@2x.png',
                ).image,
              ),
            ),
            child: Padding(
              padding:
                  const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: 120.0,
                      height: 120.0,
                      clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset('assets/images/uiAvatar@2x.png'),
                    ),
                    Text(
                      '귀하를 쉽게 식별하도록 사진을 업로드 하세요',
                      style: CustomTheme.of(context).bodyMedium,
                    ),
                    Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            20.0, 20.0, 20.0, 0.0),
                        child: TextFormField(
                          controller: _yourNameController,
                          // focusNode: _model.yourNameFocusNode,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: '사용자 이름',
                            labelStyle: CustomTheme.of(context).bodySmall,
                            hintText: '홍길동...',
                            hintStyle: CustomTheme.of(context).bodySmall,
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            filled: true,
                            fillColor:
                                CustomTheme.of(context).primaryBackground,
                            contentPadding:
                                const EdgeInsetsDirectional.fromSTEB(
                                    20.0, 24.0, 20.0, 24.0),
                          ),
                          style: CustomTheme.of(context).bodyMedium,
                          validator: null,
                        )
                        // .animateOnPageLoad(
                        //     animationsMap['textFieldOnPageLoadAnimation1']!),
                        ),
                    Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            20.0, 20.0, 20.0, 0.0),
                        child: TextFormField(
                          controller: _juminController,
                          focusNode: null,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: '주민번호',
                            labelStyle: CustomTheme.of(context).bodySmall,
                            hintText: '000000-0000000',
                            hintStyle: CustomTheme.of(context).bodySmall,
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            filled: true,
                            fillColor:
                                CustomTheme.of(context).primaryBackground,
                            contentPadding:
                                const EdgeInsetsDirectional.fromSTEB(
                                    20.0, 24.0, 20.0, 24.0),
                          ),
                          style: CustomTheme.of(context).bodyMedium,
                          keyboardType: TextInputType.number,
                          validator: null,
                        )
                        //.animateOnPageLoad(
                        //        animationsMap['textFieldOnPageLoadAnimation2']!),
                        ),
                    Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            20.0, 20.0, 20.0, 0.0),
                        child: TextFormField(
                          controller: _phoneController,
                          // focusNode: _model.ailmentsFocusNode,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: '핸드폰',
                            labelStyle: CustomTheme.of(context).bodySmall,
                            hintText: '010-1234-5678',
                            hintStyle: CustomTheme.of(context).bodySmall,
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color.fromARGB(0, 128, 81, 81),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            filled: true,
                            fillColor:
                                CustomTheme.of(context).primaryBackground,
                            contentPadding:
                                const EdgeInsetsDirectional.fromSTEB(
                                    20.0, 24.0, 20.0, 24.0),
                          ),
                          style: CustomTheme.of(context).bodyMedium,
                          keyboardType: TextInputType.number,
                          validator: null,
                        )
                        // .animateOnPageLoad(
                        //     animationsMap['textFieldOnPageLoadAnimation3']!),
                        ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          20.0, 12.0, 20.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            '성별',
                            style: CustomTheme.of(context).bodyMedium,
                          )
                          // .animateOnPageLoad(
                          //     animationsMap['textOnPageLoadAnimation2']!),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          20.0, 12.0, 20.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: CustomRadioButton(
                                options: [
                                  '남성',
                                  '여성',
                                  '비공개',
                                ].toList(),
                                onChanged: (val) => setState(() {}),
                                controller: null,
                                // radioButtonValueController ??=
                                //     TextEditingController<String>(null),
                                optionHeight: 25.0,
                                textStyle: CustomTheme.of(context).bodySmall,
                                selectedTextStyle:
                                    CustomTheme.of(context).bodyMedium,
                                textPadding:
                                    const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 15.0, 0.0),
                                buttonPosition: RadioButtonPosition.left,
                                direction: Axis.horizontal,
                                radioButtonColor:
                                    CustomTheme.of(context).primary,
                                inactiveRadioButtonColor:
                                    CustomTheme.of(context).grayLight,
                                toggleable: false,
                                horizontalAlignment: WrapAlignment.center,
                                verticalAlignment: WrapCrossAlignment.start,
                              )
                              // .animateOnPageLoad(animationsMap[
                              //     'radioButtonOnPageLoadAnimation']!),
                              ),
                        ],
                      ),
                    ),
                    // if (responsiveVisibility(
                    //   context: context,
                    //   phone: false,
                    //   tablet: false,
                    //   tabletLandscape: false,
                    //   desktop: false,
                    // ))
                    // Padding(
                    //   padding:
                    //       EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                    //   child: FFButtonWidget(
                    //     onPressed: () async {
                    //       context.pushNamed('addAnotherProfile');
                    //     },
                    //     text: FFLocalizations.of(context).getText(
                    //       'axtm7ab1' /* Add Another Profile */,
                    //     ),
                    //     icon: Icon(
                    //       Icons.add_rounded,
                    //       size: 15.0,
                    //     ),
                    //     options: FFButtonOptions(
                    //       width: 230.0,
                    //       height: 50.0,
                    //       padding: EdgeInsetsDirectional.fromSTEB(
                    //           0.0, 0.0, 0.0, 0.0),
                    //       iconPadding: EdgeInsetsDirectional.fromSTEB(
                    //           0.0, 0.0, 0.0, 0.0),
                    //       color: CustomTheme.of(context).secondaryBackground,
                    //       textStyle:
                    //           CustomTheme.of(context).titleSmall.override(
                    //                 fontFamily: 'Outfit',
                    //                 color: CustomTheme.of(context).primaryText,
                    //               ),
                    //       elevation: 3.0,
                    //       borderSide: BorderSide(
                    //         color: Colors.transparent,
                    //         width: 1.0,
                    //       ),
                    //       borderRadius: BorderRadius.circular(40.0),
                    //     ),
                    //   ).animateOnPageLoad(
                    //       animationsMap['buttonOnPageLoadAnimation1']!),
                    // ),
                    // Padding(
                    //   padding: const EdgeInsetsDirectional.fromSTEB(
                    //       0.0, 24.0, 0.0, 0.0),
                    //   child:
                    // StreamBuilder<UsersRecord>(
                    //   stream: UsersRecord.getDocument(currentUserReference!),
                    //   builder: (context, snapshot) {
                    //     // Customize what your widget looks like when it's loading.
                    //     if (!snapshot.hasData) {
                    //       return Center(
                    //         child: SizedBox(
                    //           width: 40.0,
                    //           height: 40.0,
                    //           child: SpinKitPumpingHeart(
                    //             color: CustomTheme.of(context).primary,
                    //             size: 40.0,
                    //           ),
                    //         ),
                    //       );
                    //     }
                    //     final buttonLoginUsersRecord = snapshot.data!;
                    //     return FFButtonWidget(
                    //       onPressed: () async {
                    //         await buttonLoginUsersRecord.reference
                    //             .update(createUsersRecordData(
                    //           displayName: _model.yourNameController.text,
                    //           age:
                    //               int.tryParse(_model.yourAgeController.text),
                    //           ailments: _model.ailmentsController.text,
                    //           userSex: _model.radioButtonValue,
                    //         ));

                    //         context.pushNamed('homePage');
                    //       },
                    //       text: FFLocalizations.of(context).getText(
                    //         'nj8ntcvx' /* Complete Profile */,
                    //       ),
                    //       options: FFButtonOptions(
                    //         width: 230.0,
                    //         height: 50.0,
                    //         padding: EdgeInsetsDirectional.fromSTEB(
                    //             0.0, 0.0, 0.0, 0.0),
                    //         iconPadding: EdgeInsetsDirectional.fromSTEB(
                    //             0.0, 0.0, 0.0, 0.0),
                    //         color: CustomTheme.of(context).primary,
                    //         textStyle: CustomTheme.of(context).titleSmall,
                    //         elevation: 3.0,
                    //         borderSide: BorderSide(
                    //           color: Colors.transparent,
                    //           width: 1.0,
                    //         ),
                    //         borderRadius: BorderRadius.circular(40.0),
                    //       ),
                    //     // ).animateOnPageLoad(
                    //     //     animationsMap['buttonOnPageLoadAnimation2']!);
                    //   },
                    // ),
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),

      // const SafeArea(
      //     top: true,
      //     child: Column(
      //       mainAxisSize: MainAxisSize.max,
      //       children: [
      //         Padding(
      //           padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 12.0),
      //           child: Row(mainAxisSize: MainAxisSize.max, children: [
      //             Text(
      //               '설정',
      //               // style: CustomTheme.of(context).bodySmall,
      //               /* customTheme bodySmall 설정 확인!  */
      //             ),
      //           ]),
      //         ),
      //         // Expanded(child: ),
      //         Text('개인, 가족 추가, 약국, 처방전 설정,'),
      //         ElevatedButton(
      //           onPressed: signout,
      //           child: Text(
      //             'Log out',
      //             style: TextStyle(),
      //           ),
      //         )
      //       ],
      //     )),
    );
  }
}

Future<void> signout() async {
  User? user = FirebaseAuth.instance.currentUser;
  await FirebaseAuth.instance.signOut();
  log('${user?.uid} : log out!');
}
