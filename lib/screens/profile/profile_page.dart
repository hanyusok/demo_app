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
      stream: _profileService.getProfiles(),
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
                            Divider(
                              height: 4.0,
                              thickness: 1.0,
                              color: CustomTheme.of(context).primaryBackground,
                            ),
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
