import 'package:flutter/material.dart';

import 'package:hotel_motel/constans/route_name_constans.dart';
import 'package:hotel_motel/data/models/booking_thumbnail_model.dart';
import 'package:hotel_motel/screens/home_screens/bookings/widgets/booking_thumbnail/booking_thumbnail_add_review_button.dart';
import 'package:hotel_motel/screens/home_screens/bookings/widgets/booking_thumbnail/booking_thumbnail_content.dart';
import 'package:hotel_motel/screens/home_screens/bookings/widgets/booking_thumbnail/booking_thumbnail_details.dart';
import 'package:hotel_motel/screens/home_screens/bookings/widgets/booking_thumbnail/booking_thumbnail_title.dart';

import '../../../../../theme/colors.dart';
import '../../../../../theme/design_system.dart';

class BookingThumbnail extends StatelessWidget {
  final BookingThumbnailModel booking;
  const BookingThumbnail({
    Key? key,
    required this.booking,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: Insets.xs),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, AppRoute.BOOKING_ROUTE);
        },
        splashColor: InsetsColors.splashColor,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Card(
            child: Column(
              children: [
                BookingThumbnailContent(
                    booking: booking.booking, hotel: booking.hotel),
                BookingThumbnailAddReviewButto(booking: booking.booking),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
