// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:hotel_motel/data/models/review_details_model.dart';

// ignore: must_be_immutable
class ReviewModel extends Equatable {
  final String hotelID;
  final String userUid;
  final String bookingID;
  ReviewDetailsModel details;
  String comment;
  ReviewModel({
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
      hotelID: map['hotel_id'] as String,
      userUid: map['reviewer_uid'] as String,
      bookingID: map['booking_id'] as String,
      reviewDetails:
          ReviewDetailsModel.fromMap(map['score'] as Map<String, num>),
      initComment: map['comment'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ReviewModel.fromJson(String source) =>
      ReviewModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
