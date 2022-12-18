import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Hotel extends Equatable {
  final String hotelID;
  final String name;
  final String category;
  final bool isFreeCanceling;
  final bool isRecomended;
  final String description;
  final num rating;
  final Map score;
  final String country;
  final String city;
  final String zipcode;
  final String street;
  final String buildingNumber;
  final String localNumber;
  final String PhonePrefix;
  final String PhoneNumber;
  final String email;
  Hotel({
    required this.hotelID,
    required this.name,
    required this.category,
    required this.isFreeCanceling,
    required this.isRecomended,
    required this.description,
    required this.rating,
    required this.score,
    required this.country,
    required this.city,
    required this.zipcode,
    required this.street,
    required this.buildingNumber,
    required this.localNumber,
    required this.PhonePrefix,
    required this.PhoneNumber,
    required this.email,
  });

  static Hotel fromSnapshot(DocumentSnapshot snap) {
    return Hotel(
      hotelID: snap.id,
      name: snap['name'] as String,
      category: snap['category'] as String,
      isFreeCanceling: snap['free_canceling'] as bool,
      isRecomended: snap['isRecomended'] as bool,
      description: snap['description'] as String,
      rating: snap['rating'] as num,
      score: Map.from((snap['score'] as Map)),
      country: snap['country'] as String,
      city: snap['city'] as String,
      zipcode: snap['zipcode'] as String,
      street: snap['street'] as String,
      buildingNumber: snap['bulding_number'] as String,
      localNumber: snap['local_number'] as String,
      PhonePrefix: snap['phone_prefix'] as String,
      PhoneNumber: snap['phone_number'] as String,
      email: snap['email'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'hotelID': hotelID,
      'name': name,
      'category': category,
      'isFreeCanceling': isFreeCanceling,
      'isRecomended': isRecomended,
      'description': description,
      'rating': rating,
      'score': score,
      'country': country,
      'city': city,
      'zipcode': zipcode,
      'street': street,
      'buildingNumber': buildingNumber,
      'localNumber': localNumber,
      'PhonePrefix': PhonePrefix,
      'PhoneNumber': PhoneNumber,
      'Email': email,
    };
  }

  factory Hotel.fromMap(Map<String, dynamic> map) {
    return Hotel(
      hotelID: map['hotelID'] as String,
      name: map['name'] as String,
      category: map['category'] as String,
      isFreeCanceling: map['isFreeCanceling'] as bool,
      isRecomended: map['isRecomended'] as bool,
      description: map['description'] as String,
      rating: map['rating'] as num,
      score: Map.from(map['score'] as Map),
      country: map['country'] as String,
      city: map['city'] as String,
      zipcode: map['zipcode'] as String,
      street: map['street'] as String,
      buildingNumber: map['buildingNumber'] as String,
      localNumber: map['localNumber'] as String,
      PhonePrefix: map['PhonePrefix'] as String,
      PhoneNumber: map['PhoneNumber'] as String,
      email: map['Email'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Hotel.fromJson(String source) =>
      Hotel.fromMap(json.decode(source) as Map<String, dynamic>);

  Hotel copyWith({
    String? hotelID,
    String? name,
    String? category,
    bool? isFreeCanceling,
    bool? isRecomended,
    String? description,
    num? rating,
    Map? score,
    String? country,
    String? city,
    String? zipcode,
    String? street,
    String? buildingNumber,
    String? localNumber,
    String? PhonePrefix,
    String? PhoneNumber,
    String? Email,
  }) {
    return Hotel(
      hotelID: hotelID ?? this.hotelID,
      name: name ?? this.name,
      category: category ?? this.category,
      isFreeCanceling: isFreeCanceling ?? this.isFreeCanceling,
      isRecomended: isRecomended ?? this.isRecomended,
      description: description ?? this.description,
      rating: rating ?? this.rating,
      score: score ?? this.score,
      country: country ?? this.country,
      city: city ?? this.city,
      zipcode: zipcode ?? this.zipcode,
      street: street ?? this.street,
      buildingNumber: buildingNumber ?? this.buildingNumber,
      localNumber: localNumber ?? this.localNumber,
      PhonePrefix: PhonePrefix ?? this.PhonePrefix,
      PhoneNumber: PhoneNumber ?? this.PhoneNumber,
      email: Email ?? this.email,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      hotelID,
      name,
      category,
      isFreeCanceling,
      isRecomended,
      description,
      rating,
      score,
      country,
      city,
      zipcode,
      street,
      buildingNumber,
      localNumber,
      PhonePrefix,
      PhoneNumber,
      email,
    ];
  }
}
