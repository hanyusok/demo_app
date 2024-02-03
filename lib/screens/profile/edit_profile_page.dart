import 'package:demo_app/themes/custom_radio_button.dart';
import 'package:demo_app/themes/custom_theme.dart';
import 'package:flutter/material.dart';
// import 'package:demo_app/services/profile_service.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  // final ProfileService _profileService = ProfileService();
  final TextEditingController _displayNameController = TextEditingController();
  final TextEditingController _juminController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  // final TextEditingController _photoUrlController = TextEditingController();
  final TextEditingController _memberController = TextEditingController();
  // final formKey = GlobalKey<FormState>();
  // final User? user = FirebaseAuth.instance.currentUser;
  // final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: scaffoldKey,
      appBar: _appBar(),
      body: _buildUI(),
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
          // context.pop();
        },
        child: Icon(
          Icons.chevron_left_rounded,
          color: CustomTheme.of(context).grayLight,
          size: 32.0,
        ),
      ),
      title: Text(
        '사용자 수정',
        style: CustomTheme.of(context).headlineSmall,
      ),
      // actions: const [],
      centerTitle: false,
      elevation: 0.0,
    );
  }

  Widget _buildUI() {
    return Container(
      width: MediaQuery.sizeOf(context).width * 1.0,
      height: MediaQuery.sizeOf(context).height * 1.0,
      decoration: const BoxDecoration(),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 90.0,
                height: 90.0,
                decoration: BoxDecoration(
                  color: CustomTheme.of(context).darkBackground,
                  shape: BoxShape.circle,
                ),
                child: Container(
                  width: 80.0,
                  height: 80.0,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.network(
                    // editProfileUser.photoUrl,
                    /* 개인 사진을 변경 update하기*/
                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/health-ai-mj6puy/assets/hu4vs0lstizz/UI_avatar_2@3x.png',
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                child: ElevatedButton(
                  onPressed: () async {
                    /* 개인 사진을 변경 update하기*/
                  },
                  style: ElevatedButton.styleFrom(
                      foregroundColor:
                          CustomTheme.of(context).primaryBackground,
                      elevation: 2.0,
                      minimumSize: const Size(140, 40),
                      side: const BorderSide(
                          color: Colors.transparent, width: 1.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8))),
                  child: const Text(
                    '사진 변경',
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                child: TextFormField(
                  controller: _displayNameController,
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
                    fillColor: CustomTheme.of(context).primaryBackground,
                    contentPadding: const EdgeInsetsDirectional.fromSTEB(
                        20.0, 24.0, 20.0, 24.0),
                  ),
                  style: CustomTheme.of(context).bodyMedium,
                  validator: null, /* 나중에 추가해야 */
                ),
              ),
              Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                child: TextFormField(
                  controller: _juminController,
                  // focusNode: _juminFocusNode,
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
                        color: Color.fromARGB(0, 119, 100, 100),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    filled: true,
                    fillColor: CustomTheme.of(context).primaryBackground,
                    contentPadding: const EdgeInsetsDirectional.fromSTEB(
                        20.0, 24.0, 20.0, 24.0),
                  ),
                  style: CustomTheme.of(context).bodyMedium,
                  keyboardType: TextInputType.number,
                  validator: null, /* 추가 코드 요망*/
                ),
              ),
              Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                child: TextFormField(
                  controller: _phoneController,
                  // focusNode: _yourAgeFocusNode,
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
                        color: Color(0x00000000),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    filled: true,
                    fillColor: CustomTheme.of(context).primaryBackground,
                    contentPadding: const EdgeInsetsDirectional.fromSTEB(
                        20.0, 24.0, 20.0, 24.0),
                  ),
                  style: CustomTheme.of(context).bodyMedium,
                  keyboardType: TextInputType.number,
                  validator: null, /* 추가 수정요망*/
                ),
              ),
              Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(20.0, 12.0, 20.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      '가족 관계',
                      style: CustomTheme.of(context).bodySmall,
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(20.0, 6.0, 20.0, 0.0),
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
                        selectedTextStyle: CustomTheme.of(context).bodyMedium,
                        textPadding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 0.0, 0.0, 0.0),
                        buttonPosition: RadioButtonPosition.left,
                        direction: Axis.horizontal,
                        radioButtonColor: Colors.indigo,
                        inactiveRadioButtonColor:
                            CustomTheme.of(context).grayLight,
                        toggleable: false,
                        horizontalAlignment: WrapAlignment.center,
                        verticalAlignment: WrapCrossAlignment.start,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                child: ElevatedButton(
                  onPressed: () async {
                    /* 변경 update 저장하기*/
                    /* 변경 저장후 profiles Page 로 가기*/
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
                  child: const Text('변경하기'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
