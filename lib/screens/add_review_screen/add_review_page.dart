// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:hotel_motel/data/models/booking_thumbnail_model.dart';
import 'package:hotel_motel/screens/add_review_screen/widgets/Review_appbar.dart';
import 'package:hotel_motel/screens/add_review_screen/widgets/Review_star_rating.dart';
import 'package:hotel_motel/screens/add_review_screen/widgets/review_add_comment.dart';
import 'package:hotel_motel/screens/add_review_screen/widgets/review_booking_details.dart';
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
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              floating: false,
              pinned: true,
              delegate: ReviewAppbar(
                  booking: bookingDetails.booking, hotel: bookingDetails.hotel),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(Insets.s),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ReviewStarRating(),
                    ReviewDetailsRating(),
                    ReviewaddComment(),
                    Container(
                      height: 10000,
                    )
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
