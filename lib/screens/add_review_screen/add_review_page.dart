// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:hotel_motel/data/models/booking_thumbnail_model.dart';
import 'package:hotel_motel/data/models/review_model.dart';
import 'package:hotel_motel/screens/add_review_screen/widgets/Review_appbar.dart';
import 'package:hotel_motel/screens/add_review_screen/widgets/Review_star_rating.dart';
import 'package:hotel_motel/screens/add_review_screen/widgets/review_add_comment.dart';
import 'package:hotel_motel/screens/add_review_screen/widgets/review_details_rating.dart';
import 'package:hotel_motel/theme/design_system.dart';

class AddReviewPage extends StatelessWidget {
  final BookingThumbnailModel bookingDetails;
  const AddReviewPage({
    Key? key,
    required this.bookingDetails,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ReviewModel review = ReviewModel(
      hotelID: bookingDetails.hotel.hotelID,
      userUid: bookingDetails.booking.userUid,
    );
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              floating: true,
              pinned: false,
              delegate: ReviewAppbar(
                  booking: bookingDetails.booking, hotel: bookingDetails.hotel),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(Insets.s),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Review your trip!",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                    const SizedBox(height: Insets.s),
                    ReviewStarRating(
                        onChanged: (value) => review.totalScore = value),
                    const SizedBox(height: Insets.s),
                    ReviewDetailsRating(
                      onChanged: (details) => review.details = details,
                    ),
                    const SizedBox(height: Insets.s),
                    ReviewaddComment(
                      onChanged: (value) => review.comment = value,
                    ),
                    const SizedBox(height: Insets.s),
                    Center(
                        child: ElevatedButton(
                            onPressed: () {
                              print(review);
                            },
                            child: const Text("Send")))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
