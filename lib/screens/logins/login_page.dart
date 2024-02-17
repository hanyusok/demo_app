// import 'dart:js_util';

import 'dart:developer';
// import 'dart:math';
// import 'package:email_validator/email_validator.dart';
// import 'package:demo_app/auth/auth_manager.dart';
// import 'package:demo_app/services/kakao_auth_service.dart';
import 'package:demo_app/themes/custom_theme.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:demo_app/services/fb_auth_service.dart';
import 'package:flutter/services.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart' as kakao;
import 'package:sign_in_button/sign_in_button.dart';

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
  late TabController _tabController;
  late bool _passwordLoginVisibility;
  // final User? user = FirebaseAuth.instance.currentUser;
  final FbAuthService _fbAuth = FbAuthService();

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
    _emailController.dispose();
    _passwordController.dispose();
  }

  void signUpUser() async {
    await _fbAuth.signUpWithEmail(
        email: _emailController.text,
        password: _passwordController.text,
        context: context);
  }

  void loginUser() {
    _fbAuth.loginWithEmail(
        email: _emailController.text,
        password: _passwordController.text,
        context: context);
  }

  void anonymousUser() async {
    await _fbAuth.anonymousUserSign(context);
  }

  /* kakao login*/
  void loginAsKakao() async {
    // 카카오톡 실행이 가능하면 카카오톡으로 로그인, 아니면 카카오계정으로 로그인
    if (await kakao.isKakaoTalkInstalled()) {
      try {
        await kakao.UserApi.instance.loginWithKakaoTalk();
        log('카카오톡으로 로그인 성공');
      } catch (error) {
        log('카카오톡으로 로그인 실패 $error');

        // 사용자가 카카오톡 설치 후 디바이스 권한 요청 화면에서 로그인을 취소한 경우,
        // 의도적인 로그인 취소로 보고 카카오계정으로 로그인 시도 없이 로그인 취소로 처리 (예: 뒤로 가기)
        if (error is PlatformException && error.code == 'CANCELED') {}
        // 카카오톡에 연결된 카카오계정이 없는 경우, 카카오계정으로 로그인
        try {
          await kakao.UserApi.instance.loginWithKakaoAccount();
          log('카카오계정으로 로그인 성공');
        } catch (error) {
          log('카카오계정으로 로그인 실패 $error');
        }
      }
    } else {
      try {
        await kakao.UserApi.instance.loginWithKakaoAccount();
        log('카카오계정으로 로그인 성공');
      } catch (error) {
        log('카카오계정으로 로그인 실패 $error');
      }
    }
  }

  /* kakao logout*/
  void logoutAsKakao() async {
    try {
      await kakao.UserApi.instance.logout();
      log('로그아웃 성공, SDK에서 토큰 삭제');
    } catch (error) {
      log('로그아웃 실패, SDK에서 토큰 삭제 $error');
    }
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
                          /* 대문 사진 이미지 */
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
                              /* 로그인 vs 계정 만들기 tab */
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
                                              validator: (value) {
                                                if (value == null ||
                                                    value.isEmpty ||
                                                    !value.contains('@') ||
                                                    !value.contains('.')) {
                                                  return 'Invalid Email';
                                                }
                                                return null;
                                              }, /* -- email validator 작동 잘하는지??? -- */ /* email validator 추가하자*/
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
                                                      0.0, 24.0, 0.0, 10.0),
                                              child: ElevatedButton(
                                                onPressed: loginUser,
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
                                                .fromSTEB(0.0, 10.0, 0.0, 10.0),
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
                                                            BorderRadius.circular(
                                                                40))),
                                                onPressed: () {},
                                                child: const Text('비밀번호 잃으셨나요?')),
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
                                                    minimumSize:
                                                        const Size(230, 50),
                                                    textStyle: const TextStyle(
                                                        fontSize: 18),
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(40))),
                                                onPressed: anonymousUser,
                                                child: const Text('임시 계정')),
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
                                                    minimumSize:
                                                        const Size(230, 50),
                                                    textStyle: const TextStyle(
                                                        fontSize: 18),
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(40))),
                                                onPressed: loginAsKakao,
                                                child:
                                                    const Text('Kakao Sign In')),
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
                                                    minimumSize:
                                                        const Size(230, 50),
                                                    textStyle: const TextStyle(
                                                        fontSize: 18),
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(40))),
                                                onPressed: logoutAsKakao,
                                                child:
                                                    const Text('Kakao logout')),
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
                                                    minimumSize:
                                                        const Size(230, 50),
                                                    textStyle: const TextStyle(
                                                        fontSize: 18),
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(40))),
                                                onPressed: () {
                                                  _fbAuth.signInWithGoogle(
                                                      context);
                                                },
                                                child: const Text(
                                                    'Google Sign In')),
                                          ),
                                          SignInButton(Buttons.google,
                                              text: "Google", onPressed: () {
                                            //
                                          })
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
                                              validator: (value) {
                                                if (value == null ||
                                                    value.isEmpty ||
                                                    !value.contains('@') ||
                                                    !value.contains('.')) {
                                                  return 'Invalid Email';
                                                }
                                                return null;
                                              }, /* ---- email validator 추가하자 -----*/
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
                                                onPressed: signUpUser,
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
                                                    minimumSize:
                                                        const Size(230, 50),
                                                    textStyle: const TextStyle(
                                                        fontSize: 18),
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(40))),
                                                onPressed: anonymousUser,
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
