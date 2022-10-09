import 'package:flutter/material.dart';

import '../../../../theme/design_system.dart';
import '../widgets/booking_thumbnail/booking_thumbnail.dart';

class RealizedBooking extends StatelessWidget {
  const RealizedBooking({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(Insets.s),
        child: Column(children: <Widget>[
          BookingThumbnail(),
          BookingThumbnail(),
          BookingThumbnail(),
          BookingThumbnail(),
          BookingThumbnail(),
          BookingThumbnail(),
          BookingThumbnail(),
          BookingThumbnail(),
          BookingThumbnail(),
          BookingThumbnail(),
          BookingThumbnail(),
          BookingThumbnail(),
        ]),
      ),
    );
  }
}
