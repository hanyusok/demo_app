import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/widgets.dart';

class UserModel {
  String? name;
  String? jumin;
  String? gender;
  String? phone;
  Timestamp? createdAt;
  Timestamp? updatedAt;
  UserModel({
    required this.name,
    required this.jumin,
    required this.gender,
    required this.phone,
    required this.createdAt,
    required this.updatedAt,
  });

  UserModel.fromMap(Map<String, dynamic> map) {
    name = map['name'];
    jumin = map['jumin'];
    gender = map['gender'];
    phone = map['phone'];
    createdAt = map['createdAt'];
    updatedAt = map['updatedAt'];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'name': name,
      'jumin': jumin,
      'gender': gender,
      'phone': phone,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
    return map;
  }
}
