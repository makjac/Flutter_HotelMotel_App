// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:hotel_motel/models/review_details_model.dart';

// ignore: must_be_immutable
class ReviewModel extends Equatable {
  final String? reviewID;
  final String hotelID;
  final String userUid;
  final String bookingID;
  ReviewDetailsModel details;
  String comment;
  ReviewModel({
    this.reviewID,
    required this.hotelID,
    required this.userUid,
    required this.bookingID,
    ReviewDetailsModel? reviewDetails,
    String? initComment,
  })  : details = reviewDetails ?? ReviewDetailsModel(),
        comment = initComment ?? "";

  @override
  List<Object?> get props => [
        hotelID,
        userUid,
        details,
        comment,
      ];

  @override
  bool get stringify => true;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'hotel_id': hotelID,
      'reviewer_uid': userUid,
      'booking_id': bookingID,
      'score': details.toMap(),
      'comment': comment,
    };
  }

  factory ReviewModel.fromMap(Map<String, dynamic> map) {
    return ReviewModel(
      reviewID: map['opinion_id'] as String,
      hotelID: map['hotel_id'] as String,
      userUid: map['reviewer_uid'] as String,
      bookingID: map['booking_id'] as String,
      reviewDetails:
          ReviewDetailsModel.fromMap(map['score'] as Map<String, num>),
      initComment: map['comment'] as String,
    );
  }

  static ReviewModel fromSnapshot(DocumentSnapshot snap) {
    return ReviewModel(
      reviewID: snap.id,
      hotelID: snap['hotel_id'] as String,
      userUid: snap['reviewer_uid'] as String,
      bookingID: snap['booking_id'] as String,
      reviewDetails:
          ReviewDetailsModel.fromMap(snap['score'] as Map<String, dynamic>),
      initComment: snap['comment'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ReviewModel.fromJson(String source) =>
      ReviewModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
