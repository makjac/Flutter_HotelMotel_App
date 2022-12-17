// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Favorite extends Equatable {
  final List<String>? favoriteHotels;
  final List<String>? favoriteLocation;
  const Favorite({
    this.favoriteHotels,
    this.favoriteLocation,
  });

  static Favorite fromSnapshot(DocumentSnapshot snap) {
    return Favorite(
      favoriteHotels: (snap['favorite_hotels'] as List)
          .map((hotel) => hotel as String)
          .toList(),
      //List<String>.from(snap['favorite_hotels'] as List<String>),
      favoriteLocation: (snap['favorite_location'] as List)
          .map((location) => location as String)
          .toList(),
    );
  }

  Favorite copyWith({
    List<String>? favoriteHotels,
    List<String>? favoriteLocation,
  }) {
    return Favorite(
      favoriteHotels: favoriteHotels ?? this.favoriteHotels,
      favoriteLocation: favoriteLocation ?? this.favoriteLocation,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'favorite_hotels': favoriteHotels,
      'favorite_hocation': favoriteLocation,
    };
  }

  factory Favorite.fromMap(Map<String, dynamic> map) {
    return Favorite(
      favoriteHotels: List<String>.from(map['favorite_hotels'] as List<String>),
      favoriteLocation:
          List<String>.from(map['favorite_location'] as List<String>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Favorite.fromJson(String source) =>
      Favorite.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [];
}
