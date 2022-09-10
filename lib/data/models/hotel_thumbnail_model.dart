// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

import 'package:hotel_motel/data/models/hotel_model.dart';
import 'package:hotel_motel/data/models/room_model.dart';

class HotelThumbnailModel extends Equatable {
  final String hotelID;
  final String name;
  final num rating;
  final num price;
  final bool isFeeCanceling;
  final num discount;

  HotelThumbnailModel({
    required this.hotelID,
    required this.name,
    required this.rating,
    required this.price,
    required this.isFeeCanceling,
    required this.discount,
  });

  static HotelThumbnailModel fromSnapshot(
      DocumentSnapshot Hotelsnap, DocumentSnapshot roomSnap) {
    return HotelThumbnailModel(
      hotelID: Hotelsnap.id,
      name: Hotelsnap['name'],
      rating: Hotelsnap['rating'] as num,
      price: roomSnap['price'] as num,
      discount: roomSnap['discount'] as double,
      isFeeCanceling: Hotelsnap['free_canceling'] as bool,
    );
  }

  static HotelThumbnailModel fromModels(Hotel hotel, Room room) {
    return HotelThumbnailModel(
      hotelID: hotel.hotelID,
      name: hotel.name,
      rating: hotel.rating,
      price: room.price,
      isFeeCanceling: hotel.isFreeCanceling,
      discount: room.discount,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'hotelID': hotelID,
      'name': name,
      'rating': rating,
      'price': price,
      'isFeeCanceling': isFeeCanceling,
      'discount': discount,
    };
  }

  factory HotelThumbnailModel.fromMap(Map<String, dynamic> map) {
    return HotelThumbnailModel(
      hotelID: map['hotelID'] as String,
      name: map['name'] as String,
      rating: map['rating'] as num,
      price: map['price'] as num,
      isFeeCanceling: map['isFeeCanceling'] as bool,
      discount: map['discount'] as num,
    );
  }

  String toJson() => json.encode(toMap());

  factory HotelThumbnailModel.fromJson(String source) =>
      HotelThumbnailModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  HotelThumbnailModel copyWith({
    String? hotelID,
    String? name,
    num? rating,
    num? price,
    bool? isFeeCanceling,
    num? discount,
  }) {
    return HotelThumbnailModel(
      hotelID: hotelID ?? this.hotelID,
      name: name ?? this.name,
      rating: rating ?? this.rating,
      price: price ?? this.price,
      isFeeCanceling: isFeeCanceling ?? this.isFeeCanceling,
      discount: discount ?? this.discount,
    );
  }

  @override
  List<Object> get props {
    return [
      hotelID,
      name,
      rating,
      price,
      isFeeCanceling,
      discount,
    ];
  }
}
