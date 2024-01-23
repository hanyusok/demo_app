// import 'dart:js_util';

import 'dart:developer';

import 'package:demo_app/themes/custom_theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  final formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmController =
      TextEditingController();
  late TabController _tabController;
  late bool _passwordLoginVisibility;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2, initialIndex: 0)
      ..addListener(() => setState(() {}));
    _passwordLoginVisibility = true;
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CustomTheme.of(context).secondaryBackground,
        body: SingleChildScrollView(
            child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
              Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: MediaQuery.sizeOf(context).height * 1.0,
                  constraints: const BoxConstraints(maxWidth: 600.0),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    image:
                        Image.asset('assets/images/page_bg_transparent@2x.png')
                            .image, /* --- 나중에 대문 이미지 바꿔라!! ----- */
                  )),
                  child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          0.0, 60.0, 0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 24.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if (Theme.of(context).brightness ==
                                    Brightness.dark)
                                  Image.asset(
                                    'assets/images/health-ai_logoVert.png',
                                    width: 200.0,
                                    height: 130.0,
                                    fit: BoxFit.fitHeight,
                                  ),
                                if (!(Theme.of(context).brightness ==
                                    Brightness.dark))
                                  Image.asset(
                                    'assets/images/logo_darkFull@2x.png',
                                    width: 200.0,
                                    height: 130.0,
                                    fit: BoxFit.fitHeight,
                                  ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(children: [
                              Align(
                                alignment: const Alignment(0.0, 0),
                                child: TabBar(
                                  isScrollable: true,
                                  labelColor: CustomTheme.of(context).primary,
                                  unselectedLabelColor:
                                      CustomTheme.of(context).grayLight,
                                  labelPadding:
                                      const EdgeInsetsDirectional.fromSTEB(
                                          24.0, 0.0, 24.0, 0.0),
                                  labelStyle:
                                      CustomTheme.of(context).titleSmall,
                                  unselectedLabelStyle: const TextStyle(),
                                  indicatorColor:
                                      CustomTheme.of(context).tertiary,
                                  indicatorWeight: 3.0,
                                  tabs: const [
                                    Tab(text: '로그인'),
                                    Tab(text: '계정만들기'),
                                  ],
                                  controller: _tabController,
                                  onTap: (i) async {
                                    [() async {}, () async {}][i]();
                                  },
                                ),
                              ),
                              Expanded(
                                  child: TabBarView(
                                controller: _tabController,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            24, 0, 24, 0),
                                    child: SingleChildScrollView(
                                        child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                          Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(0, 20, 0, 0),
                                            child: TextFormField(
                                              controller: _emailController,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelText: '이메일',
                                                labelStyle:
                                                    CustomTheme.of(context)
                                                        .bodySmall,
                                                hintText: '입력필수... ',
                                                hintStyle:
                                                    CustomTheme.of(context)
                                                        .bodySmall,
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                filled: true,
                                                fillColor:
                                                    CustomTheme.of(context)
                                                        .primaryBackground,
                                                contentPadding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        20, 24, 20, 24),
                                              ),
                                              style: CustomTheme.of(context)
                                                  .bodyMedium,
                                              validator:
                                                  null, /* email validator 추가하자*/
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(0, 12, 0, 0),
                                            child: TextFormField(
                                              controller: _passwordController,
                                              obscureText:
                                                  _passwordLoginVisibility,
                                              decoration: InputDecoration(
                                                labelText: '비밀번호',
                                                labelStyle:
                                                    CustomTheme.of(context)
                                                        .bodySmall,
                                                hintText: '입력필수... ',
                                                hintStyle:
                                                    CustomTheme.of(context)
                                                        .bodySmall,
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                filled: true,
                                                fillColor:
                                                    CustomTheme.of(context)
                                                        .primaryBackground,
                                                contentPadding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        20, 24, 20, 24),
                                                suffixIcon: InkWell(
                                                  onTap: () => setState(
                                                    () {
                                                      _passwordLoginVisibility =
                                                          !_passwordLoginVisibility;
                                                    },
                                                  ),
                                                  child: Icon(
                                                    _passwordLoginVisibility
                                                        ? Icons
                                                            .visibility_off_outlined
                                                        : Icons
                                                            .visibility_outlined,
                                                    color:
                                                        CustomTheme.of(context)
                                                            .secondaryText,
                                                    size: 20,
                                                  ),
                                                ),
                                              ),
                                              style: CustomTheme.of(context)
                                                  .bodyMedium,
                                              validator: null,
                                            ),
                                          ),
                                          Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                      0.0, 24.0, 0.0, 24.0),
                                              child: ElevatedButton(
                                                onPressed: () async {
                                                  // GoRouter.of(context)
                                                  //       .prepareAuthEvent();

                                                  //   final user = await authManager
                                                  //       .createAccountWithEmail(
                                                  //     context,
                                                  //     _model.emailAddressController
                                                  //         .text,
                                                  //     _model
                                                  //         .passwordCreateController
                                                  //         .text,
                                                  //   );
                                                  //   if (user == null) {
                                                  //     return;
                                                  //   }

                                                  //   context.pushNamedAuth(
                                                  //       'completeProfile',
                                                  //       context.mounted);
                                                },
                                                style: ElevatedButton.styleFrom(
                                                    foregroundColor:
                                                        Colors.white,
                                                    backgroundColor:
                                                        CustomTheme.of(context)
                                                            .primary,
                                                    elevation: 3.0,
                                                    side: const BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1.0),
                                                    minimumSize:
                                                        const Size(230, 50),
                                                    textStyle: TextStyle(
                                                        fontSize: 18,
                                                        color: CustomTheme.of(
                                                                context)
                                                            .textColor),
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                40))),
                                                child: const Text('로그인'),
                                              )),
                                          Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(0.0, 10.0, 0.0, 24.0),
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    foregroundColor:
                                                        CustomTheme.of(context)
                                                            .primaryText,
                                                    backgroundColor:
                                                        CustomTheme.of(context)
                                                            .secondaryBackground,
                                                    elevation: 0.0,
                                                    side: const BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1.0),
                                                    minimumSize:
                                                        const Size(185, 40),
                                                    textStyle: const TextStyle(
                                                        fontSize: 18),
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(40))),
                                                onPressed: () async {
                                                  // context.pushNamed('forgotPassword');
                                                },
                                                child:
                                                    const Text('비밀번호 잃으셨나요?')),
                                          ),
                                          Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(0.0, 10.0, 0.0, 24.0),
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    foregroundColor:
                                                        CustomTheme.of(context)
                                                            .primaryText,
                                                    backgroundColor:
                                                        CustomTheme.of(context)
                                                            .primaryBackground,
                                                    elevation: 3.0,
                                                    minimumSize: const Size(
                                                        230, 50),
                                                    textStyle: const TextStyle(
                                                        fontSize: 18),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        40))),
                                                onPressed: () async {
                                                  //  GoRouter.of(context)
                                                  //     .prepareAuthEvent();
                                                  // final user =
                                                  //     await authManager
                                                  //         .signInAnonymously(
                                                  //             context);
                                                  // if (user == null) {
                                                  //   return;
                                                  // }

                                                  // context.pushNamedAuth(
                                                  //     'homePage',
                                                  //     context.mounted);      context.mounted);
                                                },
                                                child: const Text('임시 계정')),
                                          ),
                                        ])),
                                  ),
                                  /* ----------------- SIGN UP  ------------------------------*/
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            24, 0, 24, 0),
                                    child: SingleChildScrollView(
                                        child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                          Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(0, 20, 0, 0),
                                            child: TextFormField(
                                              controller: _emailController,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelText: '이메일',
                                                labelStyle:
                                                    CustomTheme.of(context)
                                                        .bodySmall,
                                                hintText: '입력필수... ',
                                                hintStyle:
                                                    CustomTheme.of(context)
                                                        .bodySmall,
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                filled: true,
                                                fillColor:
                                                    CustomTheme.of(context)
                                                        .primaryBackground,
                                                contentPadding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        20, 24, 20, 24),
                                              ),
                                              style: CustomTheme.of(context)
                                                  .bodyMedium,
                                              validator:
                                                  null, /* ---- email validator 추가하자 -----*/
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(0, 12, 0, 0),
                                            child: TextFormField(
                                              controller: _passwordController,
                                              obscureText:
                                                  _passwordLoginVisibility,
                                              decoration: InputDecoration(
                                                labelText: '비밀번호',
                                                labelStyle:
                                                    CustomTheme.of(context)
                                                        .bodySmall,
                                                hintText: '입력필수... ',
                                                hintStyle:
                                                    CustomTheme.of(context)
                                                        .bodySmall,
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                filled: true,
                                                fillColor:
                                                    CustomTheme.of(context)
                                                        .primaryBackground,
                                                contentPadding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        20, 24, 20, 24),
                                                suffixIcon: InkWell(
                                                  onTap: () => setState(
                                                    () {
                                                      _passwordLoginVisibility =
                                                          !_passwordLoginVisibility;
                                                    },
                                                  ),
                                                  child: Icon(
                                                    _passwordLoginVisibility
                                                        ? Icons
                                                            .visibility_off_outlined
                                                        : Icons
                                                            .visibility_outlined,
                                                    color:
                                                        CustomTheme.of(context)
                                                            .secondaryText,
                                                    size: 20,
                                                  ),
                                                ),
                                              ),
                                              style: CustomTheme.of(context)
                                                  .bodyMedium,
                                              validator: null,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(0, 12, 0, 0),
                                            child: TextFormField(
                                              controller:
                                                  _passwordConfirmController,
                                              obscureText:
                                                  _passwordLoginVisibility,
                                              decoration: InputDecoration(
                                                labelText: '비밀번호확인',
                                                labelStyle:
                                                    CustomTheme.of(context)
                                                        .bodySmall,
                                                hintText: '입력필수... ',
                                                hintStyle:
                                                    CustomTheme.of(context)
                                                        .bodySmall,
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                filled: true,
                                                fillColor:
                                                    CustomTheme.of(context)
                                                        .primaryBackground,
                                                contentPadding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        20, 24, 20, 24),
                                                suffixIcon: InkWell(
                                                  onTap: () => setState(
                                                    () {
                                                      _passwordLoginVisibility =
                                                          !_passwordLoginVisibility;
                                                    },
                                                  ),
                                                  child: Icon(
                                                    _passwordLoginVisibility
                                                        ? Icons
                                                            .visibility_off_outlined
                                                        : Icons
                                                            .visibility_outlined,
                                                    color:
                                                        CustomTheme.of(context)
                                                            .secondaryText,
                                                    size: 20,
                                                  ),
                                                ),
                                              ),
                                              style: CustomTheme.of(context)
                                                  .bodyMedium,
                                              validator:
                                                  null, /* ---- password validator 추가하자 -----*/
                                            ),
                                          ),
                                          Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                      0.0, 24.0, 0.0, 24.0),
                                              child: ElevatedButton(
                                                onPressed: () {
                                                  // GoRouter.of(context)
                                                  //       .prepareAuthEvent();
                                                  try {
                                                    FirebaseAuth.instance
                                                        .createUserWithEmailAndPassword(
                                                            email:
                                                                _emailController
                                                                    .text,
                                                            password:
                                                                _passwordConfirmController
                                                                    .text);
                                                  } on FirebaseAuthException catch (e) {
                                                    log(e.message.toString());
                                                  }

                                                  final user = FirebaseAuth
                                                      .instance.currentUser;
                                                  if (user != null) {
                                                    log('login success');
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                            const SnackBar(
                                                      content:
                                                          Text("계정이 생성되었습니다."),
                                                      duration:
                                                          Duration(seconds: 3),
                                                    ));
                                                    Navigator.pushNamed(
                                                        context, '/homepage');
                                                  }
                                                },
                                                style: ElevatedButton.styleFrom(
                                                    foregroundColor:
                                                        Colors.white,
                                                    backgroundColor:
                                                        CustomTheme.of(context)
                                                            .primary,
                                                    elevation: 3.0,
                                                    side: const BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1.0),
                                                    minimumSize:
                                                        const Size(230, 50),
                                                    textStyle: TextStyle(
                                                        fontSize: 18,
                                                        color: CustomTheme.of(
                                                                context)
                                                            .textColor),
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                40))),
                                                child: const Text('계정만들기'),
                                              )),
                                          Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(0.0, 10.0, 0.0, 24.0),
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    foregroundColor:
                                                        CustomTheme.of(context)
                                                            .primaryText,
                                                    backgroundColor:
                                                        CustomTheme.of(context)
                                                            .primaryBackground,
                                                    elevation: 3.0,
                                                    minimumSize: const Size(
                                                        230, 50),
                                                    textStyle: const TextStyle(
                                                        fontSize: 18),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        40))),
                                                onPressed: () async {
                                                  //  GoRouter.of(context)
                                                  //     .prepareAuthEvent();
                                                  // final user =
                                                  //     await authManager
                                                  //         .signInAnonymously(
                                                  //             context);
                                                  // if (user == null) {
                                                  //   return;
                                                  // }

                                                  // context.pushNamedAuth(
                                                  //     'homePage',
                                                  //     context.mounted);      context.mounted);
                                                },
                                                child: const Text('임시 계정')),
                                          ),
                                        ])),
                                  )
                                ],
                              )),
                            ]),
                          ),
                        ],
                      )))
            ])));
  }
}
