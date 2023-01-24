// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class UserDetails extends Equatable {
  String? name;
  String? surname;
  String? street;
  String? buildingNumber;
  String? localNumber;
  String? city;
  String? zipcode;
  String? phoneNumber;
  String? email;

  UserDetails({
    this.name,
    this.surname,
    this.street,
    this.buildingNumber,
    this.localNumber,
    this.city,
    this.zipcode,
    this.phoneNumber,
    this.email,
  });

  static UserDetails fromSnapshot(DocumentSnapshot snap) {
    return UserDetails(
      name: snap['name'],
      surname: snap['surname'],
      street: snap['street'],
      buildingNumber: snap['building_number'],
      localNumber: snap['local_number'],
      city: snap['city'],
      zipcode: snap['zipcode'],
      phoneNumber: snap['phone_number'],
      email: snap['email'],
    );
  }

  UserDetails copyWith({
    String? name,
    String? surname,
    String? street,
    String? buildingNumber,
    String? localNumber,
    String? city,
    String? zipcode,
    String? phoneNumber,
    String? email,
  }) {
    return UserDetails(
      name: name ?? this.name,
      surname: surname ?? this.surname,
      street: street ?? this.street,
      buildingNumber: buildingNumber ?? this.buildingNumber,
      localNumber: localNumber ?? this.localNumber,
      city: city ?? this.city,
      zipcode: zipcode ?? this.zipcode,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'surname': surname,
      'street': street,
      'building_number': buildingNumber,
      'local_number': localNumber,
      'city': city,
      'zipcode': zipcode,
      'phone_number': phoneNumber,
      'email': email,
    };
  }

  factory UserDetails.fromMap(Map<String, dynamic> map) {
    return UserDetails(
      name: map['name'] as String,
      surname: map['surname'] as String,
      street: map['street'] as String,
      buildingNumber: map['buildingNumber'] as String,
      localNumber: map['localNumber'] as String,
      city: map['city'] as String,
      zipcode: map['zipcode'] as String,
      phoneNumber: map['phoneNumber'] as String,
      email: map['email'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserDetails.fromJson(String source) =>
      UserDetails.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [];
  }
}
