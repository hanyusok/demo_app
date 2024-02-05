import 'dart:developer';
// import 'package:demo_app/screens/profile/create_profile_page.dart';
// import 'package:demo_app/models/profile.dart';
// import 'package:demo_app/screens/profile/create_profile_page.dart';
// import 'package:demo_app/screens/profile/create_profile_page.dart';
import 'package:demo_app/services/profile_service.dart';
import 'package:demo_app/themes/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:demo_app/themes/custom_icon_button.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfilesPage extends StatefulWidget {
  const ProfilesPage({super.key});

  @override
  State<ProfilesPage> createState() => _ProfilesPageState();
}

class _ProfilesPageState extends State<ProfilesPage> {
  final TextEditingController _memoController = TextEditingController();
  final User? user = FirebaseAuth.instance.currentUser;
  late List profiles;

  // final scaffoldKey = GlobalKey<ScaffoldState>();
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

  /* QR code 생성 대화창 코드*/
  void displayQrcodeDialog() async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('QR 코드 생성'),
            content: TextField(
              controller: _memoController,
              decoration: const InputDecoration(hintText: '간단한 증상!!'),
            ),
            actions: <Widget>[
              ElevatedButton(onPressed: () {}, child: const Text('QR code생성'))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: _appBar(),
      body: _buildUI(),
      floatingActionButton: _floatingBtn(),
    );
  }

  Widget _floatingBtn() {
    return FloatingActionButton(
      onPressed: () {
        Navigator.of(context).pushNamed('/createprofilepage');
      },
      backgroundColor: CustomTheme.of(context).primary,
      tooltip: '추가',
      child: const Icon(
        Icons.add,
        color: Colors.white,
      ),
    );
  }

  Widget _waitingSpin() {
    return Center(
      child: SizedBox(
        width: 40.0,
        height: 40.0,
        child: SpinKitPumpingHeart(
          color: CustomTheme.of(context).primary,
          size: 40.0,
        ),
      ),
    );
  }

  PreferredSizeWidget _appBar() {
    return AppBar(
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
    );
  }

  Widget _buildUI() {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          _userProfileView(),
          _profilesView(),
        ],
      ),
    );
  }

  /* user profile : 본인 */
  Widget _userProfileView() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          width: MediaQuery.sizeOf(context).width * 1.0,
          decoration: BoxDecoration(
            color: CustomTheme.of(context).secondaryBackground,
          ),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 0.0, 16.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: 44.0,
                              height: 44.0,
                              decoration: BoxDecoration(
                                color:
                                    CustomTheme.of(context).secondaryBackground,
                                borderRadius: BorderRadius.circular(8.0),
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
                                  color: CustomTheme.of(context).grayLight,
                                  size: 24.0,
                                ),
                                onPressed: () async {
                                  /* 프로필 수정 페이지로 */
                                },
                              ),
                            ),
                            /* sign out button*/
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 0.0, 0.0),
                              child: Container(
                                width: 44.0,
                                height: 44.0,
                                decoration: BoxDecoration(
                                  color: CustomTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(8.0),
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
                                    color: CustomTheme.of(context).secondary,
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
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        '사람이름',
                        // userRecentProfile['displayName'],
                        style: CustomTheme.of(context).headlineSmall,
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            4.0, 0.0, 0.0, 0.0),
                        child: Text(
                          '전화번호',
                          // userRecentProfile['phone'],
                          style: CustomTheme.of(context).titleMedium,
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
                      child: Text('주민번호',
                          // userRecentProfile['jumin'],
                          style: CustomTheme.of(context).bodyMedium
                          // .override(
                          //   fontFamily: 'Outfit',
                          //   color:
                          //       CustomTheme.of(context).primary,
                          //   fontWeight: FontWeight.w500,
                          // ),
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
    );
  }

  /* profile : 본인이외의 가족들 */
  Widget _profilesView() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        /* 가족 구성원 label */
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(20.0, 12.0, 20.0, 12.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                '가족 구성원',
                style: CustomTheme.of(context).bodySmall,
              ),
              Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/createprofilepage');
                    },
                    child: Text(
                      '가족추가',
                      style: CustomTheme.of(context).bodySmall,
                    )),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 24.0),
          child: _profileStreamBuilder(),
        ),
      ],
    );
  }

  Widget _profileStreamBuilder() {
    return StreamBuilder(
        stream: _profileService.getProfiles(),
        builder: (context, snapshot) {
          profiles = snapshot.data?.docs ?? [];
          if (!snapshot.hasData) {
            return _waitingSpin();
            /* or createProfilePage 라우팅 */
          } else {
            log(profiles.toList().toString());

            return _listViewbldr();
          }
        });
  }

  Widget _listViewbldr() {
    return ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: profiles.length,
      itemBuilder: _itembldr,
    );
  }

  /* item listing*/
  Widget _itembldr(context, index) {
    final profile = profiles[index].data();
    late String profileId = profiles[index].id;
    // log('profile id is $profile');
    log('profileId is $profileId');
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        /* profile edit view 로 연결*/
      },
      child: Container(
        width: MediaQuery.sizeOf(context).width * 1.0,
        decoration: BoxDecoration(
          color: CustomTheme.of(context).secondaryBackground,
          boxShadow: const [
            BoxShadow(
              blurRadius: 4.0,
              color: Color(0x230F1113),
              offset: Offset(0.0, 2.0),
            )
          ],
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              /* 윗줄*/
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          4.0, 0.0, 0.0, 0.0),
                      child: Text(
                        profile.displayName,
                        /* 이름 */
                        style: CustomTheme.of(context).headlineSmall,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          4.0, 0.0, 0.0, 0.0),
                      child: Text(
                        profile.jumin,
                        /* 주민번호*/
                        style: CustomTheme.of(context).bodyMedium,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.chevron_right_rounded,
                    color: CustomTheme.of(context).grayLight,
                    size: 24.0,
                  ),
                ],
              ),
              /* 둘째 줄*/
              Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      color: CustomTheme.of(context).primaryBackground,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                8.0, 4.0, 8.0, 4.0),
                            child: Text(
                              profile.member,
                              style: CustomTheme.of(context).bodySmall,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 8.0, 0.0),
                            child: Text(
                              profile.phone,
                              style: CustomTheme.of(context).bodyMedium,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              /* 3째줄 */
              Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          '수정',
                          style: CustomTheme.of(context).bodySmall,
                        )),
                    ElevatedButton(
                        onPressed: () {
                          _profileService.deleteProfile(profileId);
                        },
                        child: Text(
                          '삭제',
                          style: CustomTheme.of(context).bodySmall,
                        )),
                    ElevatedButton(
                        onPressed: displayQrcodeDialog,
                        /* QR code 생성 dialogue*/
                        child: Text(
                          'QR',
                          style: CustomTheme.of(context).bodySmall,
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
