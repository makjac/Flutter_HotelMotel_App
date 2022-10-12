// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Booking extends Equatable {
  final String bookingID;
  final String hotelID;
  final String roomID;
  final String userUid;
  final DateTime created;
  final DateTime startTime;
  final DateTime endTime;
  final String status;
  final String payment;
  Booking({
    required this.bookingID,
    required this.hotelID,
    required this.roomID,
    required this.userUid,
    required this.created,
    required this.startTime,
    required this.endTime,
    required this.status,
    required this.payment,
  });

  static Booking fromSnapshot(DocumentSnapshot snap) {
    return Booking(
      bookingID: snap.id,
      hotelID: snap['hotel_id'] as String,
      roomID: snap['room_id'] as String,
      userUid: snap['user_uid'] as String,
      created: DateTime.fromMillisecondsSinceEpoch(
          snap['created'].millisecondsSinceEpoch as int),
      startTime: DateTime.fromMillisecondsSinceEpoch(
          snap['start_time'].millisecondsSinceEpoch as int),
      endTime: DateTime.fromMillisecondsSinceEpoch(
          snap['end_time'].millisecondsSinceEpoch as int),
      status: snap['status'] as String,
      payment: snap['payment'] as String,
    );
  }

  @override
  List<Object> get props {
    return [
      bookingID,
      hotelID,
      roomID,
      userUid,
      created,
      startTime,
      endTime,
      status,
      payment,
    ];
  }

  @override
  bool get stringify => true;

  Booking copyWith({
    String? bookingID,
    String? hotelID,
    String? roomID,
    String? userUid,
    DateTime? created,
    DateTime? startTime,
    DateTime? endTime,
    String? status,
    String? paytment,
  }) {
    return Booking(
      bookingID: bookingID ?? this.bookingID,
      hotelID: hotelID ?? this.hotelID,
      roomID: roomID ?? this.roomID,
      userUid: userUid ?? this.userUid,
      created: created ?? this.created,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      status: status ?? this.status,
      payment: paytment ?? this.payment,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'booking_id': bookingID,
      'hotel_id': hotelID,
      'room_id': roomID,
      'user_uid': userUid,
      'created': created.millisecondsSinceEpoch,
      'start_time': startTime.millisecondsSinceEpoch,
      'end_time': endTime.millisecondsSinceEpoch,
      'status': status,
      'paytment': payment,
    };
  }

  factory Booking.fromMap(Map<String, dynamic> map) {
    return Booking(
      bookingID: map['booking_id'] as String,
      hotelID: map['hotel_id'] as String,
      roomID: map['room_id'] as String,
      userUid: map['user_uid'] as String,
      created: DateTime.fromMillisecondsSinceEpoch(map['created'] as int),
      startTime: DateTime.fromMillisecondsSinceEpoch(map['start_time'] as int),
      endTime: DateTime.fromMillisecondsSinceEpoch(map['end_time'] as int),
      status: map['status'] as String,
      payment: map['paytment'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Booking.fromJson(String source) =>
      Booking.fromMap(json.decode(source) as Map<String, dynamic>);
}
