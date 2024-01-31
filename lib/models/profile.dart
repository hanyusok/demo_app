import 'package:cloud_firestore/cloud_firestore.dart';

class Profile {
  String? id;
  String? displayName;
  String? jumin;
  String? member;
  String? phone;
  String? photoUrl;
  Timestamp? createdAt;
  Timestamp? updatedAt;
  Profile({
    required this.id,
    required this.displayName,
    required this.jumin,
    required this.member,
    required this.phone,
    required this.photoUrl,
    required this.createdAt,
    required this.updatedAt,
  });

  Profile.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    displayName = map['displayName'];
    jumin = map['jumin'];
    member = map['member'];
    phone = map['phone'];
    photoUrl = map['photoUrl'];
    createdAt = map['createdAt'];
    updatedAt = map['updatedAt'];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'id': id,
      'displayName': displayName,
      'jumin': jumin,
      'member': member,
      'phone': phone,
      'photoUrl': photoUrl,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
    return map;
  }
}
