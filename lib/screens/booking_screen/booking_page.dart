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

import '../../data/repository/firebase/analitic/analitics_repository.dart';
import '../../locator.dart';

class BookingPage extends StatefulWidget {
  final BookingThumbnailModel details;
  const BookingPage({
    Key? key,
    required this.details,
  }) : super(key: key);

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  @override
  void initState() {
    locator.get<AnalyticsRepository>().measureScreenview({
      'firebase_screen': 'booking_overview_page',
      'firebase_screen_class': 'bookings',
      'hm_user': widget.details.booking.userUid,
      'hm_hotel': widget.details.hotel.hotelID,
    });
    super.initState();
  }

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
                hotel: widget.details.hotel,
                room: widget.details.room,
              ),
              AddreviewButton(bookingDetails: widget.details),
              AppDivider(),
              BookingDetails(booking: widget.details.booking),
              AppDivider(),
              ContactDetails(hotel: widget.details.hotel),
              AppDivider(),
              PriceDetails(
                booking: widget.details.booking,
                room: widget.details.room,
              ),
              SizedBox(height: Insets.s),
              CancellBookingButton(booking: widget.details.booking),
            ],
          ),
        ),
      ),
    );
  }
}
