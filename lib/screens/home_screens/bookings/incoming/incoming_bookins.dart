// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:hotel_motel/models/booking_thumbnail_model.dart';
import 'package:hotel_motel/screens/home_screens/bookings/widgets/booking_thumbnail/booking_thumbnail.dart';
import 'package:hotel_motel/theme/theme_base.dart';

class IncomingBooking extends StatelessWidget {
  final List<BookingThumbnailModel> thumbnails;

  const IncomingBooking({
    Key? key,
    required this.thumbnails,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(Insets.s),
        child: Column(
            children: thumbnails
                .where((booking) => booking.booking.status == "active")
                .where((booking) =>
                    booking.booking.startTime.isAfter(DateTime.now()))
                .map((booking) => BookingThumbnail(booking: booking))
                .toList()),
      ),
    );
  }
}
