// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:hotel_motel/constans/route_name_constans.dart';
import 'package:hotel_motel/data/models/booking_thumbnail_model.dart';

import '../../../../../theme/design_system.dart';

class BookingThumbnailAddReviewButto extends StatelessWidget {
  final BookingThumbnailModel booking;
  const BookingThumbnailAddReviewButto({
    Key? key,
    required this.booking,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (booking.booking.opinion == "none" &&
        booking.booking.status != "inactive") {
      if (booking.booking.startTime.isBefore(DateTime.now())) {
        return InkWell(
          onTap: () {
            Navigator.pushNamed(context, AppRoute.ADD_REVIEW_ROUTE,
                arguments: booking);
          },
          child: Container(
            color: Colors.black12,
            child: Padding(
              padding: const EdgeInsets.all(Insets.xs),
              child: Row(
                children: [
                  Icon(Icons.add_comment),
                  SizedBox(width: Insets.xs),
                  const Text("Add review"),
                ],
              ),
            ),
          ),
        );
      }
    }
    return Container(height: 0.001, width: 0.001);
  }
}
