// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Hotel extends Equatable {
  final String hotelID;
  final String name;
  final String category;
  final bool isFreeCanceling;
  final bool isRecomended;
  final double rating;
  final String country;
  final String city;
  final String zipcode;
  final String street;
  final String buildingNumber;
  final String localNumber;
  final String PhonePrefix;
  final String PhoneNumber;
  final String Email;
  Hotel({
    required this.hotelID,
    required this.name,
    required this.category,
    required this.isFreeCanceling,
    required this.isRecomended,
    required this.rating,
    required this.country,
    required this.city,
    required this.zipcode,
    required this.street,
    required this.buildingNumber,
    required this.localNumber,
    required this.PhonePrefix,
    required this.PhoneNumber,
    required this.Email,
  });

  static Hotel fromSnapshot(DocumentSnapshot snap) {
    return Hotel(
      hotelID: snap.id,
      name: snap['name'] as String,
      category: snap['category'] as String,
      isFreeCanceling: snap['free_canceling'] as bool,
      isRecomended: snap['isRecomended'] as bool,
      rating: snap['rating'] as double,
      country: snap['country'] as String,
      city: snap['city'] as String,
      zipcode: snap['zipcode'] as String,
      street: snap['street'] as String,
      buildingNumber: snap['bulding_number'] as String,
      localNumber: snap['local_number'] as String,
      PhonePrefix: snap['phone_prefix'] as String,
      PhoneNumber: snap['phone_number'] as String,
      Email: snap['email'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'hotel_id': hotelID,
      'name': name,
      'category': category,
      'free_canceling': isFreeCanceling,
      'isRecomended': isRecomended,
      'rating': rating,
      'country': country,
      'city': city,
      'zipcode': zipcode,
      'street': street,
      'building_number': buildingNumber,
      'local_number': localNumber,
      'Phone_prefix': PhonePrefix,
      'Phone_number': PhoneNumber,
      'Email': Email,
    };
  }

  factory Hotel.fromMap(Map<String, dynamic> map) {
    return Hotel(
      hotelID: map['hotel_id'] as String,
      name: map['name'] as String,
      category: map['category'] as String,
      isFreeCanceling: map['free_canceling'] as bool,
      isRecomended: map['isRecomended'] as bool,
      rating: map['rating'] as double,
      country: map['country'] as String,
      city: map['city'] as String,
      zipcode: map['zipcode'] as String,
      street: map['street'] as String,
      buildingNumber: map['building_number'] as String,
      localNumber: map['local_number'] as String,
      PhonePrefix: map['Phone_prefix'] as String,
      PhoneNumber: map['Phone_number'] as String,
      Email: map['Email'] as String,
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
    double? rating,
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
      rating: rating ?? this.rating,
      country: country ?? this.country,
      city: city ?? this.city,
      zipcode: zipcode ?? this.zipcode,
      street: street ?? this.street,
      buildingNumber: buildingNumber ?? this.buildingNumber,
      localNumber: localNumber ?? this.localNumber,
      PhonePrefix: PhonePrefix ?? this.PhonePrefix,
      PhoneNumber: PhoneNumber ?? this.PhoneNumber,
      Email: Email ?? this.Email,
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
      rating,
      country,
      city,
      zipcode,
      street,
      buildingNumber,
      localNumber,
      PhonePrefix,
      PhoneNumber,
      Email,
    ];
  }
}
