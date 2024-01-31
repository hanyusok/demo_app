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

  Stream<QuerySnapshot> getUserProfiles() {
    return _usersRef!.snapshots();
  }

  void addUserProfile(Profile profile) async {
    _usersRef?.add(profile);
  }
}
