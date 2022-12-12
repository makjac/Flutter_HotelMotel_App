// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:hotel_motel/data/models/booking_thumbnail_model.dart';
import 'package:hotel_motel/screens/booking_screen/widgets/add_review_button.dart';
import 'package:hotel_motel/screens/booking_screen/widgets/booking_details.dart';
import 'package:hotel_motel/screens/booking_screen/widgets/cancell_booking_button.dart';
import 'package:hotel_motel/screens/booking_screen/widgets/contact_details.dart';
import 'package:hotel_motel/screens/booking_screen/widgets/hotel_details.dart';
import 'package:hotel_motel/screens/booking_screen/widgets/price_details.dart';
import 'package:hotel_motel/theme/design_system.dart';
import 'package:hotel_motel/widgets/decorations/app_divider.dart';

class BookingPage extends StatelessWidget {
  final BookingThumbnailModel details;
  const BookingPage({
    Key? key,
    required this.details,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Booking details"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HotelDetails(
                hotel: details.hotel,
                room: details.room,
              ),
              AddreviewButton(bookingDetails: details),
              AppDivider(),
              BookingDetails(booking: details.booking),
              AppDivider(),
              ContactDetails(hotel: details.hotel),
              AppDivider(),
              PriceDetails(
                booking: details.booking,
                room: details.room,
              ),
              SizedBox(height: Insets.s),
              CancellBookingButton(booking: details.booking),
            ],
          ),
        ),
      ),
    );
  }
}
