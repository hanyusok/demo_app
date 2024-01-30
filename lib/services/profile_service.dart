// import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_app/models/profile.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileService {
  final User? user = FirebaseAuth.instance.currentUser;
  final _firestore = FirebaseFirestore.instance;
  late final CollectionReference? _usersRef;

  ProfileService() {
    _usersRef = _firestore
        .collection("users")
        .doc(user!.uid)
        .collection("profiles")
        .withConverter<Profile>(
            fromFirestore: (snapshots, _) => Profile.fromMap(
                  snapshots.data()!,
                ),
            toFirestore: (userData, _) => userData.toMap());
  }

  Stream<QuerySnapshot> getUsers() {
    return _usersRef!.snapshots();
  }

  void addUserProfile(Profile profile) async {
    _usersRef?.add(profile);
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