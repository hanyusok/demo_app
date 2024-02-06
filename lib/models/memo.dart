import 'package:cloud_firestore/cloud_firestore.dart';

class Memo {
  String? id;
  String? description;
  String? profileId;
  String? userId;
  int? cost;
  bool? deskAccepted;
  bool? isDone;
  Timestamp? createdAt;
  Timestamp? finishedAt;
  Memo({
    this.id,
    this.description,
    this.profileId,
    this.userId,
    this.cost,
    this.deskAccepted,
    this.isDone,
    this.createdAt,
    this.finishedAt,
  });

  Memo.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    description = map['description'];
    profileId = map['profileId'];
    userId = map['userId'];
    cost = map['cost'];
    deskAccepted = map['deskAccepted'];
    isDone = map['isDone'];
    createdAt = map['createdAt'];
    finishedAt = map['finishedAt'];
  }

  Memo copyWith({
    String? id,
    String? description,
    String? profileId,
    String? userId,
    int? cost,
    bool? deskAccepted,
    bool? isDone,
    Timestamp? createdAt,
    Timestamp? finishedAt,
  }) {
    return Memo(
      id: id ?? this.id,
      description: description ?? this.description,
      profileId: profileId ?? this.profileId,
      userId: userId ?? this.userId,
      cost: cost ?? this.cost,
      deskAccepted: deskAccepted ?? this.deskAccepted,
      isDone: isDone ?? this.isDone,
      createdAt: createdAt ?? this.createdAt,
      finishedAt: finishedAt ?? this.finishedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'description': description,
      'profileId': profileId,
      'userId': userId,
      'cost': cost,
      'deskAccepted': deskAccepted,
      'isDone': isDone,
      'createdAt': createdAt,
      'finishedAt': finishedAt,
    };
  }
}
