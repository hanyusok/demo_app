/* => profile */
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_app/models/profile.dart';
import 'package:demo_app/themes/custom_radio_button.dart';
import 'package:demo_app/themes/custom_theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:demo_app/services/profile_service.dart';

class CreateProfilePage extends StatefulWidget {
  const CreateProfilePage({super.key});

  @override
  State<CreateProfilePage> createState() => _CreateProfilePageState();
}

class _CreateProfilePageState extends State<CreateProfilePage> {
  final ProfileService _profileService = ProfileService();
  final TextEditingController _displayNameController = TextEditingController();
  final TextEditingController _juminController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _memberController = TextEditingController();
  // final formKey = GlobalKey<FormState>();
  final User? user = FirebaseAuth.instance.currentUser;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void signout() async {
    await FirebaseAuth.instance.signOut();
    log('${user?.uid} : log out!');
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
                          controller: _displayNameController,
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
                        )),
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
                        )),
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
                        )),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          20.0, 12.0, 20.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            '가족관계',
                            style: CustomTheme.of(context).bodyMedium,
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          10.0, 12.0, 10.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: CustomRadioButton(
                                options: [
                                  '본인',
                                  '배우자',
                                  '부모',
                                  '자녀',
                                ].toList(),
                                onChanged: (val) => setState(() {}),
                                controller: _memberController,
                                optionHeight: 25.0,
                                textStyle: CustomTheme.of(context).bodySmall,
                                selectedTextStyle:
                                    CustomTheme.of(context).bodyMedium,
                                textPadding:
                                    const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                buttonPosition: RadioButtonPosition.left,
                                direction: Axis.horizontal,
                                radioButtonColor: Colors.indigo,
                                /* CustomTheme.of(context).primary, */
                                inactiveRadioButtonColor:
                                    CustomTheme.of(context).grayLight,
                                toggleable: false,
                                horizontalAlignment: WrapAlignment.center,
                                verticalAlignment: WrapCrossAlignment.start,
                              )),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          0.0, 15.0, 0.0, 0.0),
                      child: ElevatedButton(
                        onPressed: () {
                          Profile userProfile = Profile(
                              id: user!.uid,
                              displayName: _displayNameController.text,
                              jumin: _juminController.text,
                              member: _memberController.text,
                              phone: _phoneController.text,
                              createdAt: Timestamp.now(),
                              updatedAt: null);
                          _profileService.addUserProfile(userProfile);
                        },
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
