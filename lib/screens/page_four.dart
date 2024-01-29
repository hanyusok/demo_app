import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_app/themes/custom_radio_button.dart';
import 'package:demo_app/themes/custom_theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:demo_app/services/profile_service.dart';

class PageFour extends StatefulWidget {
  const PageFour({super.key});

  @override
  State<PageFour> createState() => _PageFourState();
}

class _PageFourState extends State<PageFour> {
  TextEditingController? _nameController;
  TextEditingController? _juminController;
  TextEditingController? _phoneController;
  TextEditingController? _genderController;
  // final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void signout() async {
    User? user = FirebaseAuth.instance.currentUser;
    await FirebaseAuth.instance.signOut();
    log('${user?.uid} : log out!');
  }

  void addProfile() async {
    await ProfileService().newUserProfile(
        _nameController!.text,
        _juminController!.text,
        _phoneController!.text,
        _genderController!.text);

    if (!context.mounted) return;
    Navigator.pop(context);
  }

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
                          // key: formKey,
                          controller: _nameController,
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
                                controller: _genderController ??=
                                    TextEditingController(),
                                optionHeight: 25.0,
                                textStyle: CustomTheme.of(context).bodySmall,
                                selectedTextStyle:
                                    CustomTheme.of(context).bodyMedium,
                                textPadding:
                                    const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 15.0, 0.0),
                                buttonPosition: RadioButtonPosition.left,
                                direction: Axis.horizontal,
                                radioButtonColor: Colors.indigo,
                                /* CustomTheme.of(context).primary, */
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
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          0.0, 15.0, 0.0, 0.0),
                      child: ElevatedButton(
                        onPressed: addProfile,
                        style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: CustomTheme.of(context).primary,
                            elevation: 3.0,
                            side: const BorderSide(
                                color: Colors.transparent, width: 1.0),
                            minimumSize: const Size(230, 50),
                            textStyle: TextStyle(
                                fontSize: 18,
                                color: CustomTheme.of(context).textColor),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40))),
                        child: const Text('설정하기'),
                      ),
                    ),
                    /*---  나중에 삭제하자  ---*/

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
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
