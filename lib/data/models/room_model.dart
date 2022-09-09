// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Room extends Equatable {
  final String roomID;
  final String descryption;
  final double price;
  final double discount;
  final int numberOfRooms;
  final int capacity;
  final Map bedsType;
  final Map facilities;
  const Room({
    required this.roomID,
    required this.descryption,
    required this.price,
    required this.discount,
    required this.numberOfRooms,
    required this.capacity,
    required this.bedsType,
    required this.facilities,
  });

  static Room fromSnapshot(DocumentSnapshot snap) {
    return Room(
      roomID: snap.id,
      descryption: snap['description'] as String,
      price: snap['price'] as double,
      discount: snap['discount'] as double,
      numberOfRooms: snap['Number_of_rooms'] as int,
      capacity: snap['capacity'] as int,
      bedsType: Map.from((snap['beds_types'] as Map)),
      facilities: Map.from((snap['facilities'] as Map)),
    );
  }

  Room copyWith({
    String? roomID,
    String? descryption,
    double? price,
    double? discount,
    int? numberOfRooms,
    int? capacity,
    Map? bedsType,
    Map? facilities,
  }) {
    return Room(
      roomID: roomID ?? this.roomID,
      descryption: descryption ?? this.descryption,
      price: price ?? this.price,
      discount: discount ?? this.discount,
      numberOfRooms: numberOfRooms ?? this.numberOfRooms,
      capacity: capacity ?? this.capacity,
      bedsType: bedsType ?? this.bedsType,
      facilities: facilities ?? this.facilities,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'room_id': roomID,
      'descryption': descryption,
      'price': price,
      'discount': discount,
      'number_of_rooms': numberOfRooms,
      'capacity': capacity,
      'beds_type': bedsType,
      'facilities': facilities,
    };
  }

  factory Room.fromMap(Map<String, dynamic> map) {
    return Room(
      roomID: map['room_id'] as String,
      descryption: map['descryption'] as String,
      price: map['price'] as double,
      discount: map['discount'] as double,
      numberOfRooms: map['number_of_rooms'] as int,
      capacity: map['capacity'] as int,
      bedsType: Map.from((map['beds_type'] as Map)),
      facilities: Map.from((map['facilities'] as Map)),
    );
  }

  String toJson() => json.encode(toMap());

  factory Room.fromJson(String source) =>
      Room.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      roomID,
      descryption,
      price,
      discount,
      numberOfRooms,
      capacity,
      bedsType,
      facilities,
    ];
  }
}
