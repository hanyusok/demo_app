import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_app/models/memo.dart';
import 'package:firebase_auth/firebase_auth.dart';

final User? user = FirebaseAuth.instance.currentUser;
final _firestore = FirebaseFirestore.instance;
DocumentReference? _profileRef =
    _firestore.collection("users").doc(user!.uid).collection("profiles").doc();
String? profileId = _profileRef?.id;
late CollectionReference? _memoRef;

class MemoService {
  MemoService() {
    _memoRef = _profileRef?.collection("memos").withConverter<Memo>(
        fromFirestore: (snapshots, _) => Memo.fromMap(snapshots.data()!),
        toFirestore: (memo, _) => memo.toMap());
  }

  Stream<QuerySnapshot> getMemos() {
    return _memoRef!.snapshots();
  }

  /* user memo(사용자 1인) 가져오기*/
  // Stream<QuerySnapshot> getUserMemo() {}

  // Future<String?> uploadImageToStorage(String childName, Uint8List file) async {
  //   Reference ref = _storage.ref().child(childName).child('id');
  //   UploadTask uploadTask = ref.putData(file);
  //   TaskSnapshot snapshot = await uploadTask;
  //   String downloadUrl = await snapshot.ref.getDownloadURL();
  //   return downloadUrl;
  // }

  void addMemo(Memo memo) async {
    _memoRef?.add(memo);
    log('userProfile : $profileId created memo!');
  }

  void updateMemo(String memoId, Memo memo) {
    _memoRef?.doc(memoId).update(memo.toMap());
  }

  void deleteMemo(String memoId) {
    _memoRef?.doc(memoId).delete();
  }
}
