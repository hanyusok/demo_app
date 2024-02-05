// import 'dart:developer';
import 'dart:developer';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_app/models/profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

final User? user = FirebaseAuth.instance.currentUser;
final _firestore = FirebaseFirestore.instance;
final _storage = FirebaseStorage.instance;
late CollectionReference? _profileRef;
// late Profile profile;

class ProfileService {
  ProfileService() {
    _profileRef = _firestore
        .collection("users")
        .doc(user!.uid)
        .collection("profiles")
        .withConverter<Profile>(
            fromFirestore: (snapshots, _) => Profile.fromMap(snapshots.data()!),
            toFirestore: (profile, _) => profile.toMap());
  }

  Stream<QuerySnapshot> getProfiles() {
    return _profileRef!.snapshots();
  }

  /* user profile(사용자 1인) 가져오기*/
  // Stream<QuerySnapshot> getUserProfile() {}

  Future<String?> uploadImageToStorage(String childName, Uint8List file) async {
    Reference ref = _storage.ref().child(childName).child('id');
    UploadTask uploadTask = ref.putData(file);
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  void addProfile(Profile profile) async {
    _profileRef?.add(profile);
    log('user :${user?.uid} created profile!');
  }

  void updateProfile(String profileId, Profile profile) {
    _profileRef?.doc(profileId).update(profile.toMap());
  }

  void deleteProfile(String profileId) {
    _profileRef?.doc(profileId).delete();
  }
}
