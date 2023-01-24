// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

import 'favorite_model.dart';

// ignore: must_be_immutable
class UserModel extends Equatable {
  String? uid;
  String? displayName;
  String? avatarUrl;
  bool? anonim;
  Favorite? favorite;
  UserModel({
    this.uid,
    this.displayName,
    this.avatarUrl,
    this.anonim,
    this.favorite,
  });

  static UserModel fromSnapshot(DocumentSnapshot snap) {
    return UserModel(
      uid: snap.id,
      anonim: snap['anonim'] != null ? snap['anonim'] as bool : null,
      displayName: snap['username'] != null ? snap['username'] as String : null,
    );
  }

  @override
  List<Object> get props => [];

  @override
  bool get stringify => true;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': displayName,
      'anonim': anonim,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] != null ? map['uid'] as String : null,
      displayName: map['username'] != null ? map['username'] as String : null,
      avatarUrl: map['avatar_url'] != null ? map['avatar_url'] as String : null,
      anonim: map['anonim'] != null ? map['anonim'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  UserModel copyWith({
    String? uid,
    String? displayName,
    String? avatarUrl,
    bool? anonim,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      displayName: displayName ?? this.displayName,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      anonim: anonim ?? this.anonim,
    );
  }
}
