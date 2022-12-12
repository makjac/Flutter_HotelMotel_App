// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_motel/bloc/review/review_bloc.dart';

import 'package:hotel_motel/data/models/booking_thumbnail_model.dart';
import 'package:hotel_motel/data/models/review_model.dart';
import 'package:hotel_motel/screens/add_review_screen/widgets/Review_appbar.dart';
import 'package:hotel_motel/screens/add_review_screen/widgets/Review_star_rating.dart';
import 'package:hotel_motel/screens/add_review_screen/widgets/review_add_comment.dart';
import 'package:hotel_motel/screens/add_review_screen/widgets/review_details_rating.dart';
import 'package:hotel_motel/theme/design_system.dart';
import 'package:hotel_motel/widgets/decorations/app_divider.dart';

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
      bookingID: bookingDetails.booking.bookingID,
    );
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: Insets.s, right: Insets.s, top: Insets.s),
                    child: const Text(
                      "Review your trip!",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                  ),
                  const SizedBox(height: Insets.xs),
                  ReviewStarRating(
                      onChanged: (value) => review.details.total = value),
                  AppDivider(),
                  ReviewDetailsRating(
                    onChanged: (details) => review.details = details,
                  ),
                  AppDivider(),
                  ReviewaddComment(
                    onChanged: (value) => review.comment = value,
                  ),
                  const SizedBox(height: Insets.s),
                  BlocBuilder<ReviewBloc, ReviewState>(
                      builder: ((context, state) {
                    if (state is AddReview) {
                      return Center(
                        child: ElevatedButton(
                          onPressed: () {},
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }
                    return Center(
                      child: ElevatedButton(
                        onPressed: () {
                          BlocProvider.of<ReviewBloc>(context)
                              .add(AddReview(review: review));
                        },
                        child: const Text("Send"),
                      ),
                    );
                  })),
                  const SizedBox(height: Insets.s),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
