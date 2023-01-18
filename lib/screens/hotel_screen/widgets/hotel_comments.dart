// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:hotel_motel/locator.dart';
import 'package:hotel_motel/models/review_model.dart';
import 'package:hotel_motel/repository/model_repositores/review_repository/review_repository.dart';
import 'package:hotel_motel/screens/hotel_screen/widgets/hotel_opinion.dart';

class HotelComments extends StatelessWidget {
  final String hotelID;
  const HotelComments({
    Key? key,
    required this.hotelID,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<ReviewModel>>(
      stream: locator.get<ReviewRepository>().GetHotelReviews(hotelID),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            children: snapshot.data!
                .map(
                  (comment) => HotelOpinion(opinion: comment),
                )
                .toList(),
          );
        }
        if (!snapshot.hasData) {
          return Text("No comment");
        }
        if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }
        return Center(
          child: CircularProgressIndicator(color: Colors.black),
        );
      },
    );
  }
}
