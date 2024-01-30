import 'package:cloud_firestore/cloud_firestore.dart';

class Profile {
  String? id;
  String? name;
  String? jumin;
  String? member;
  String? phone;
  Timestamp? createdAt;
  Timestamp? updatedAt;
  Profile({
    required this.id,
    required this.name,
    required this.jumin,
    required this.member,
    required this.phone,
    required this.createdAt,
    required this.updatedAt,
  });

  Profile.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    jumin = map['jumin'];
    member = map['member'];
    phone = map['phone'];
    createdAt = map['createdAt'];
    updatedAt = map['updatedAt'];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'id': id,
      'name': name,
      'jumin': jumin,
      'member': member,
      'phone': phone,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
    return map;
  }
}
