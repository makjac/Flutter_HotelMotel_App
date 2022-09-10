// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  String? uid;
  String? displayName;
  String? avatarUrl;
  List<String>? favoriteHotels;
  bool? anonim;
  UserModel({
    this.uid,
    this.displayName,
    this.avatarUrl,
    this.favoriteHotels,
    this.anonim,
  });

  static UserModel fromSnapshot(DocumentSnapshot snap) {
    return UserModel(
      uid: snap.id,
      anonim: snap['anomin'] != null ? snap['anonim'] as bool : null,
      avatarUrl:
          snap['avatar_url'] != null ? snap['avatar_url'] as String : null,
      displayName: snap['username'] != null ? snap['usernale'] as String : null,
      favoriteHotels: snap['favorite_hotels'] != null
          ? List<String>.from((snap['favorite_hotels'] as List<String>))
          : null,
    );
  }

  @override
  List<Object> get props {
    return [];
  }

  @override
  bool get stringify => true;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'displayName': displayName,
      'avatarUrl': avatarUrl,
      'favoriteHotels': favoriteHotels,
      'anonim': anonim,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] != null ? map['uid'] as String : null,
      displayName: map['username'] != null ? map['username'] as String : null,
      avatarUrl: map['avatar_url'] != null ? map['avatar_url'] as String : null,
      favoriteHotels: map['favorite_hotels'] != null
          ? List<String>.from((map['favorite_hotels'] as List<String>))
          : null,
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
    List<String>? favoriteHotels,
    bool? anonim,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      displayName: displayName ?? this.displayName,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      favoriteHotels: favoriteHotels ?? this.favoriteHotels,
      anonim: anonim ?? this.anonim,
    );
  }
}
