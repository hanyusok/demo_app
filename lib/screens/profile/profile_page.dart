import 'dart:developer';

// import 'package:demo_app/models/profile.dart';
import 'package:demo_app/screens/profile/create_profile_page.dart';
import 'package:demo_app/services/profile_service.dart';
import 'package:demo_app/themes/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:demo_app/themes/custom_icon_button.dart';
// import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final User? user = FirebaseAuth.instance.currentUser;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final ProfileService _profileService = ProfileService();
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
    return StreamBuilder(
      stream: _profileService.getUserProfiles(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: CustomTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 40.0,
                height: 40.0,
                child: SpinKitPumpingHeart(
                  color: CustomTheme.of(context).primary,
                  size: 40.0,
                ),
              ),
            ),
          );
        }
        final List userProfiles = snapshot.data?.docs ?? [];
        if (userProfiles.isEmpty) {
          return const CreateProfilePage();
        }
        final userRecentProfile = userProfiles.last;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: CustomTheme.of(context).primaryBackground,
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
              '사용자',
              style: CustomTheme.of(context).headlineSmall,
            ),
            // actions: [],
            centerTitle: false,
            elevation: 0.0,
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      decoration: BoxDecoration(
                        color: CustomTheme.of(context).secondaryBackground,
                      ),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 0.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Card(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    color: CustomTheme.of(context).primary,
                                    elevation: 2.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(40.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Container(
                                        width: 60.0,
                                        height: 60.0,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: Image.asset(
                                          'assets/images/UI_avatar_2@3x.png',
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 16.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          width: 44.0,
                                          height: 44.0,
                                          decoration: BoxDecoration(
                                            color: CustomTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            border: Border.all(
                                              color: Colors.grey,
                                              // CustomTheme.of(context).primaryBackground,
                                              width: 2.0,
                                            ),
                                          ),
                                          child: CustomIconButton(
                                            borderColor: Colors.transparent,
                                            borderRadius: 30.0,
                                            buttonSize: 46.0,
                                            icon: Icon(
                                              Icons.edit_outlined,
                                              color: CustomTheme.of(context)
                                                  .grayLight,
                                              size: 24.0,
                                            ),
                                            onPressed: () async {
                                              /* 프로필 수정 페이지로 */
                                              // context.pushNamed(
                                              //   'editProfile',
                                              //   queryParameters: {
                                              //     'userProfile': serializeParam(
                                              //       profilePageUsersRecord
                                              //           .reference,
                                              //       ParamType.DocumentReference,
                                              //     ),
                                              //   }.withoutNulls,
                                              // );
                                            },
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(12.0, 0.0, 0.0, 0.0),
                                          child: Container(
                                            width: 44.0,
                                            height: 44.0,
                                            decoration: BoxDecoration(
                                              color: CustomTheme.of(context)
                                                  .secondaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              border: Border.all(
                                                color: Colors.grey,
                                                // CustomTheme.of(context).primaryBackground,
                                                width: 2.0,
                                              ),
                                            ),
                                            child: CustomIconButton(
                                              borderColor: Colors.transparent,
                                              borderRadius: 30.0,
                                              buttonSize: 46.0,
                                              icon: Icon(
                                                Icons.login_rounded,
                                                color: CustomTheme.of(context)
                                                    .secondary,
                                                size: 24.0,
                                              ),
                                              onPressed: signout,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 12.0, 0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    userRecentProfile['displayName'],
                                    style:
                                        CustomTheme.of(context).headlineSmall,
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            4.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      userRecentProfile['phone'],
                                      style:
                                          CustomTheme.of(context).titleMedium,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 8.0, 0.0, 0.0),
                                  child: Text(
                                    userRecentProfile['jumin'],
                                    style: CustomTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Outfit',
                                          color:
                                              CustomTheme.of(context).primary,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                            // Padding(
                            //   padding: const EdgeInsetsDirectional.fromSTEB(
                            //       0.0, 12.0, 20.0, 0.0),
                            //   child: Row(
                            //     mainAxisSize: MainAxisSize.max,
                            //     children: [
                            //       Text(
                            //         'g620lptv' /* Ailments */,
                            //         textAlign: TextAlign.start,
                            //         style: CustomTheme.of(context).bodySmall,
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            // Padding(
                            //   padding: const EdgeInsetsDirectional.fromSTEB(
                            //       0.0, 8.0, 20.0, 0.0),
                            //   child: Row(
                            //     mainAxisSize: MainAxisSize.max,
                            //     children: [
                            //       Expanded(
                            //         child: AutoSizeText(
                            //           profilePageUsersRecord.ailments,
                            //           style:
                            //               CustomTheme.of(context).headlineSmall,
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            // Padding(
                            //   padding: const EdgeInsetsDirectional.fromSTEB(
                            //       0.0, 12.0, 0.0, 12.0),
                            //   child: Row(
                            //     mainAxisSize: MainAxisSize.max,
                            //     children: [
                            //       Column(
                            //         mainAxisSize: MainAxisSize.max,
                            //         crossAxisAlignment:
                            //             CrossAxisAlignment.start,
                            //         children: [
                            //           Text(
                            //             'p73hqfca' /* Next Appointment */,
                            //             textAlign: TextAlign.start,
                            //             style:
                            //                 CustomTheme.of(context).bodySmall,
                            //           ),
                            //           Padding(
                            //             padding: const EdgeInsetsDirectional
                            //                 .fromSTEB(0.0, 4.0, 0.0, 0.0),
                            //             child: Text(
                            //               'v3xn7ijw' /* Aug 20, 2021 */,
                            //               style: CustomTheme.of(context)
                            //                   .displaySmall,
                            //             ),
                            //           ),
                            //         ],
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            // Divider(
                            //   height: 4.0,
                            //   thickness: 1.0,
                            //   color: CustomTheme.of(context).primaryBackground,
                            // ),
                            // Padding(
                            //   padding: const EdgeInsetsDirectional.fromSTEB(
                            //       0.0, 1.0, 0.0, 0.0),
                            //   child: Column(
                            //     mainAxisSize: MainAxisSize.max,
                            //     children: [
                            //       if (!(Theme.of(context).brightness ==
                            //           Brightness.dark))
                            //         InkWell(
                            //           splashColor: Colors.transparent,
                            //           focusColor: Colors.transparent,
                            //           hoverColor: Colors.transparent,
                            //           highlightColor: Colors.transparent,
                            //           onTap: () async {
                            //             // setDarkModeSetting(
                            //             //     context, ThemeMode.dark);
                            //             // if (animationsMap[
                            //             //         'containerOnActionTriggerAnimation2'] !=
                            //             //     null) {
                            //             //   setState(() =>
                            //             //       hasContainerTriggered2 = true);
                            //             //   SchedulerBinding.instance
                            //             //       .addPostFrameCallback((_) async =>
                            //             //           await animationsMap[
                            //             //                   'containerOnActionTriggerAnimation2']!
                            //             //               .controller
                            //             //               .forward(from: 0.0));
                            //             // }
                            //           },
                            //           child: Container(
                            //             width:
                            //                 MediaQuery.sizeOf(context).width *
                            //                     1.0,
                            //             decoration: const BoxDecoration(),
                            //             child: Padding(
                            //               padding: const EdgeInsetsDirectional
                            //                   .fromSTEB(0.0, 12.0, 24.0, 12.0),
                            //               child: Row(
                            //                 mainAxisSize: MainAxisSize.max,
                            //                 mainAxisAlignment:
                            //                     MainAxisAlignment.spaceBetween,
                            //                 children: [
                            //                   Text(
                            //                     'qlddph8i' /* Switch to Dark Mode */,
                            //                     style: CustomTheme.of(context)
                            //                         .bodyMedium,
                            //                   ),
                            //                   Container(
                            //                     width: 80.0,
                            //                     height: 40.0,
                            //                     decoration: BoxDecoration(
                            //                       color: CustomTheme.of(context)
                            //                           .primaryBackground,
                            //                       borderRadius:
                            //                           BorderRadius.circular(
                            //                               20.0),
                            //                     ),
                            //                     child: Stack(
                            //                       alignment:
                            //                           const AlignmentDirectional(
                            //                               0.0, 0.0),
                            //                       children: [
                            //                         const Align(
                            //                           alignment:
                            //                               AlignmentDirectional(
                            //                                   0.95, 0.0),
                            //                           child: Padding(
                            //                             padding:
                            //                                 EdgeInsetsDirectional
                            //                                     .fromSTEB(
                            //                                         0.0,
                            //                                         0.0,
                            //                                         8.0,
                            //                                         0.0),
                            //                             child: Icon(
                            //                               Icons.nights_stay,
                            //                               color:
                            //                                   Color(0xFF95A1AC),
                            //                               size: 20.0,
                            //                             ),
                            //                           ),
                            //                         ),
                            //                         Align(
                            //                             alignment:
                            //                                 const AlignmentDirectional(
                            //                                     -0.85, 0.0),
                            //                             child: Container(
                            //                               width: 36.0,
                            //                               height: 36.0,
                            //                               decoration:
                            //                                   BoxDecoration(
                            //                                 color: CustomTheme
                            //                                         .of(context)
                            //                                     .secondaryBackground,
                            //                                 boxShadow: const [
                            //                                   BoxShadow(
                            //                                     blurRadius: 4.0,
                            //                                     color: Color(
                            //                                         0x430B0D0F),
                            //                                     offset: Offset(
                            //                                         0.0, 2.0),
                            //                                   )
                            //                                 ],
                            //                                 borderRadius:
                            //                                     BorderRadius
                            //                                         .circular(
                            //                                             30.0),
                            //                                 shape: BoxShape
                            //                                     .rectangle,
                            //                               ),
                            //                             )
                            //                             // .animateOnActionTrigger(
                            //                             //     animationsMap[
                            //                             //         'containerOnActionTriggerAnimation1']!,
                            //                             //     hasBeenTriggered:
                            //                             //         hasContainerTriggered1),
                            //                             ),
                            //                       ],
                            //                     ),
                            //                   ),
                            //                 ],
                            //               ),
                            //             ),
                            //           ),
                            //         ),
                            //       if (Theme.of(context).brightness ==
                            //           Brightness.dark)
                            //         InkWell(
                            //           splashColor: Colors.transparent,
                            //           focusColor: Colors.transparent,
                            //           hoverColor: Colors.transparent,
                            //           highlightColor: Colors.transparent,
                            //           onTap: () async {
                            //             // setDarkModeSetting(
                            //             //     context, ThemeMode.light);
                            //             // if (animationsMap[
                            //             //         'containerOnActionTriggerAnimation1'] !=
                            //             //     null) {
                            //             //   setState(() =>
                            //             //       hasContainerTriggered1 = true);
                            //             //   SchedulerBinding.instance
                            //             //       .addPostFrameCallback((_) async =>
                            //             //           await animationsMap[
                            //             //                   'containerOnActionTriggerAnimation1']!
                            //             //               .controller
                            //             //               .forward(from: 0.0));
                            //             // }
                            //           },
                            //           child: Container(
                            //             width:
                            //                 MediaQuery.sizeOf(context).width *
                            //                     1.0,
                            //             decoration: const BoxDecoration(),
                            //             child: Padding(
                            //               padding: const EdgeInsetsDirectional
                            //                   .fromSTEB(0.0, 12.0, 24.0, 12.0),
                            //               child: Row(
                            //                 mainAxisSize: MainAxisSize.max,
                            //                 mainAxisAlignment:
                            //                     MainAxisAlignment.spaceBetween,
                            //                 children: [
                            //                   Text(
                            //                     'emdrumyv' /* Switch to Light Mode */,
                            //                     style: CustomTheme.of(context)
                            //                         .bodyMedium
                            //                         .override(
                            //                           fontFamily: 'Outfit',
                            //                           color: Colors.white,
                            //                           fontSize: 14.0,
                            //                           fontWeight:
                            //                               FontWeight.w500,
                            //                         ),
                            //                   ),
                            //                   Container(
                            //                     width: 80.0,
                            //                     height: 40.0,
                            //                     decoration: BoxDecoration(
                            //                       color: CustomTheme.of(context)
                            //                           .primaryBackground,
                            //                       borderRadius:
                            //                           BorderRadius.circular(
                            //                               20.0),
                            //                     ),
                            //                     child: Stack(
                            //                       alignment:
                            //                           const AlignmentDirectional(
                            //                               0.0, 0.0),
                            //                       children: [
                            //                         Align(
                            //                           alignment:
                            //                               const AlignmentDirectional(
                            //                                   -0.9, 0.0),
                            //                           child: Padding(
                            //                             padding:
                            //                                 const EdgeInsetsDirectional
                            //                                     .fromSTEB(8.0,
                            //                                     2.0, 0.0, 0.0),
                            //                             child: Icon(
                            //                               Icons
                            //                                   .wb_sunny_rounded,
                            //                               color: CustomTheme.of(
                            //                                       context)
                            //                                   .secondaryText,
                            //                               size: 24.0,
                            //                             ),
                            //                           ),
                            //                         ),
                            //                         Align(
                            //                             alignment:
                            //                                 const AlignmentDirectional(
                            //                                     0.9, 0.0),
                            //                             child: Container(
                            //                               width: 36.0,
                            //                               height: 36.0,
                            //                               decoration:
                            //                                   BoxDecoration(
                            //                                 color: CustomTheme
                            //                                         .of(context)
                            //                                     .secondaryBackground,
                            //                                 boxShadow: const [
                            //                                   BoxShadow(
                            //                                     blurRadius: 4.0,
                            //                                     color: Color(
                            //                                         0x430B0D0F),
                            //                                     offset: Offset(
                            //                                         0.0, 2.0),
                            //                                   )
                            //                                 ],
                            //                                 borderRadius:
                            //                                     BorderRadius
                            //                                         .circular(
                            //                                             30.0),
                            //                                 shape: BoxShape
                            //                                     .rectangle,
                            //                               ),
                            //                             )
                            //                             // .animateOnActionTrigger(
                            //                             //     animationsMap[
                            //                             //         'containerOnActionTriggerAnimation2']!,
                            //                             //     hasBeenTriggered:
                            //                             //         hasContainerTriggered2),
                            //                             ),
                            //                       ],
                            //                     ),
                            //                   ),
                            //                 ],
                            //               ),
                            //             ),
                            //           ),
                            //         ),
                            //     ],
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const Column(
                    //  qrcode area
                    )
              ],
            ),
          ),
        );
      },
    );
  }
}
