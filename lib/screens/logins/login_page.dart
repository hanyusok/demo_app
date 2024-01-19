// import 'dart:js_util';

import 'package:demo_app/themes/custom_theme.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  final formKey = GlobalKey<FormState>();
  final TextEditingController? _emailController = TextEditingController();
  final TextEditingController? _passwordController = TextEditingController();
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
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
                            .image,
                  )),
                  child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          0.0, 70.0, 0.0, 0.0),
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
                                  labelColor: CustomTheme.of(context).tertiary,
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
                                    Tab(text: 'Login'),
                                    Tab(text: 'Register'),
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
                                                labelText: 'Email Address',
                                                labelStyle:
                                                    CustomTheme.of(context)
                                                        .bodySmall,
                                                hintText:
                                                    'Enter your email... ',
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
                                              validator: null,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(0, 12, 0, 0),
                                            child: TextFormField(
                                              controller: _passwordController,
                                              obscureText: true,
                                              decoration: InputDecoration(
                                                labelText: 'Confirm Password',
                                                labelStyle:
                                                    CustomTheme.of(context)
                                                        .bodySmall,
                                                hintText:
                                                    'Enter your password... ',
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
                                                    () {},
                                                  ),
                                                  child: const Icon(
                                                    Icons.visibility_outlined,
                                                    color: Color(0x98FFFFFF),
                                                    size: 20,
                                                  ),
                                                ),
                                              ),
                                              style: CustomTheme.of(context)
                                                  .bodyMedium,
                                              validator: null,
                                            ),
                                          ),
                                        ])),
                                    /* button start here */
                                    // Form(
                                    //     key: formKey,
                                    //     child: Column(
                                    //       children: [
                                    //         const SizedBox(
                                    //           height: 90,
                                    //         ),
                                    //         const Text("Login"),
                                    //         const SizedBox(
                                    //           height: 10,
                                    //         ),
                                    //         SizedBox(
                                    //           width: MediaQuery.of(context).size.width * 0.9,
                                    //           child: TextFormField(
                                    //             validator: (value) =>
                                    //                 value!.isEmpty ? "Email cannot be empty" : null,
                                    //             controller: _emailController,
                                    //             decoration: const InputDecoration(
                                    //                 border: OutlineInputBorder(), label: Text("Email")),
                                    //           ),
                                    //         ),
                                    //         const SizedBox(
                                    //           height: 10,
                                    //         ),
                                    //         SizedBox(
                                    //           width: MediaQuery.of(context).size.width * 0.9,
                                    //           child: TextFormField(
                                    //             validator: (value) => value!.length < 8
                                    //                 ? "Passowrd should have at least 8 characters."
                                    //                 : null,
                                    //             controller: _passwordController,
                                    //             obscureText: true,
                                    //             decoration: const InputDecoration(
                                    //                 border: OutlineInputBorder(),
                                    //                 label: Text("Password")),
                                    //           ),
                                    //         ),
                                    //         const SizedBox(
                                    //           height: 10,
                                    //         ),
                                    //         SizedBox(
                                    //           height: 65,
                                    //           width: MediaQuery.of(context).size.width * 0.9,
                                    //           child: ElevatedButton(
                                    //               onPressed: () {
                                    //                 // method
                                    //               },
                                    //               child: const Text("Login")),
                                    //         ),
                                    //         SizedBox(
                                    //           height: 65,
                                    //           width: MediaQuery.of(context).size.width * 0.9,
                                    //           child: OutlinedButton(
                                    //               onPressed: () {},
                                    //               child: const Row(
                                    //                 mainAxisAlignment: MainAxisAlignment.center,
                                    //                 children: [
                                    //                   SizedBox(
                                    //                     width: 10,
                                    //                   ),
                                    //                   Text(
                                    //                     "Continue with Google",
                                    //                   )
                                    //                 ],
                                    //               )),
                                    //         ),
                                    //         const SizedBox(
                                    //           height: 10,
                                    //         ),
                                    //         Row(
                                    //           mainAxisAlignment: MainAxisAlignment.center,
                                    //           children: [
                                    //             const Text("Don't have an account?"),
                                    //             TextButton(
                                    //                 onPressed: () {
                                    //                   Navigator.pushNamed(context, "/signup");
                                    //                 },
                                    //                 child: const Text("Sign Up"))
                                    //           ],
                                    //         ),
                                    //         const SizedBox(
                                    //           height: 10,
                                    //         ),
                                    //       ],
                                    //     )),
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
