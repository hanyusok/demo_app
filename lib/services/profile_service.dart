import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileService {
  User? user = FirebaseAuth.instance.currentUser;
  final db = FirebaseFirestore.instance;
  late DocumentSnapshot snapshot;

  Future newUserProfile(
      String name, String jumin, String phone, String gender) async {
    Map<String, dynamic> data = {
      "name": name,
      "jumin": jumin,
      "phone": phone,
      "gender": gender,
    };
    try {
      await db
          .collection("users")
          .doc(user!.uid)
          .update(data)
          .then((snapshot) => log("doc added."));
    } catch (e) {
      log(e.toString());
    }
  }
}


          // Padding(
                    //   padding: const ),
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