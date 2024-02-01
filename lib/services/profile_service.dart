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
late CollectionReference? _usersRef;

class ProfileService {
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

  Future<String?> uploadImageToStorage(String childName, Uint8List file) async {
    Reference ref = _storage.ref().child(childName).child('id');
    UploadTask uploadTask = ref.putData(file);
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  void addUserProfile(Profile profile) async {
    _usersRef?.add(profile);
    log('profile created!');
  }
}
