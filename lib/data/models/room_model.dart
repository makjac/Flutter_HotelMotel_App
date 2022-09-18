// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Room extends Equatable {
  final String roomID;
  final String descryption;
  final num price;
  final num discount;
  final num numberOfRooms;
  final num capacity;
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
      price: snap['price'] as num,
      discount: snap['discount'] as num,
      numberOfRooms: snap['Number_of_rooms'] as num,
      capacity: snap['capacity'] as num,
      bedsType: Map.from((snap['beds_types'] as Map)),
      facilities: Map.from((snap['facilities'] as Map)),
    );
  }

  Room copyWith({
    String? roomID,
    String? descryption,
    num? price,
    num? discount,
    num? numberOfRooms,
    num? capacity,
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
      'roomID': roomID,
      'descryption': descryption,
      'price': price,
      'discount': discount,
      'numberOfRooms': numberOfRooms,
      'capacity': capacity,
      'bedsType': bedsType,
      'facilities': facilities,
    };
  }

  factory Room.fromMap(Map<String, dynamic> map) {
    return Room(
      roomID: map['roomID'] as String,
      descryption: map['descryption'] as String,
      price: map['price'] as num,
      discount: map['discount'] as num,
      numberOfRooms: map['numberOfRooms'] as num,
      capacity: map['capacity'] as num,
      bedsType: Map.from(map['bedsType'] as Map),
      facilities: Map.from(map['facilities'] as Map),
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
