// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:hotel_motel/data/models/review_details_model.dart';

class ReviewModel extends Equatable {
  final String hotelID;
  final String userUid;
  double totalScore;
  ReviewDetailsModel details;
  String comment;
  ReviewModel({
    required this.hotelID,
    required this.userUid,
    double? initTotalScore,
    ReviewDetailsModel? reviewDetails,
    String? initComment,
  })  : totalScore = initTotalScore ?? 0,
        details = reviewDetails ?? ReviewDetailsModel(),
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
}
