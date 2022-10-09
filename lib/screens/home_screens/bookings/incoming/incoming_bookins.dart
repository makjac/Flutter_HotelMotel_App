import 'package:flutter/material.dart';
import 'package:hotel_motel/screens/home_screens/bookings/widgets/booking_thumbnail/booking_thumbnail.dart';
import 'package:hotel_motel/theme/theme_base.dart';

class IncomingBooking extends StatelessWidget {
  const IncomingBooking({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(Insets.s),
        child: Column(children: <Widget>[
          BookingThumbnail(),
          BookingThumbnail(),
          BookingThumbnail(),
        ]),
      ),
    );
  }
}
