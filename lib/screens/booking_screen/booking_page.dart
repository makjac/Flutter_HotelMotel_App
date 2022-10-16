// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:hotel_motel/data/models/booking_thumbnail_model.dart';
import 'package:hotel_motel/screens/booking_screen/widgets/booking_details.dart';
import 'package:hotel_motel/screens/booking_screen/widgets/contact_details.dart';
import 'package:hotel_motel/screens/booking_screen/widgets/hotel_details.dart';
import 'package:hotel_motel/screens/booking_screen/widgets/price_details.dart';
import 'package:hotel_motel/theme/design_system.dart';

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
        body: Padding(
          padding: const EdgeInsets.all(Insets.s),
          child: Column(
            children: [
              HotelDetails(),
              Divider(),
              BookingDetails(),
              Divider(),
              ContactDetails(),
              Divider(),
              PriceDetails(),
            ],
          ),
        ),
      ),
    );
  }
}
