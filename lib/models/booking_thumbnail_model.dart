// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:hotel_motel/models/room_model.dart';

import 'booking_model.dart';
import 'hotel_model.dart';

class BookingThumbnailModel extends Equatable {
  final Booking booking;
  final Hotel hotel;
  final Room room;

  BookingThumbnailModel({
    required this.booking,
    required this.hotel,
    required this.room,
  });

  static BookingThumbnailModel fromModels(
      Booking booking, Hotel hotel, Room room) {
    return BookingThumbnailModel(booking: booking, hotel: hotel, room: room);
  }

  @override
  List<Object> get props => [
        booking,
        hotel,
        room,
      ];

  BookingThumbnailModel copyWith({
    Booking? booking,
    Hotel? hotel,
    Room? room,
  }) {
    return BookingThumbnailModel(
      booking: booking ?? this.booking,
      hotel: hotel ?? this.hotel,
      room: room ?? this.room,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'booking': booking.toMap(),
      'hotel': hotel.toMap(),
      'room': room.toMap(),
    };
  }

  factory BookingThumbnailModel.fromMap(Map<String, dynamic> map) {
    return BookingThumbnailModel(
      booking: Booking.fromMap(map['booking'] as Map<String, dynamic>),
      hotel: Hotel.fromMap(map['hotel'] as Map<String, dynamic>),
      room: Room.fromMap(map['room'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory BookingThumbnailModel.fromJson(String source) =>
      BookingThumbnailModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}
