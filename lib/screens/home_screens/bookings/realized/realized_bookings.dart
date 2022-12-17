// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../../models/booking_thumbnail_model.dart';
import '../../../../theme/design_system.dart';
import '../widgets/booking_thumbnail/booking_thumbnail.dart';

class RealizedBooking extends StatelessWidget {
  final List<BookingThumbnailModel> thumbnails;

  const RealizedBooking({
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
                    booking.booking.startTime.isBefore(DateTime.now()))
                .map((booking) => BookingThumbnail(booking: booking))
                .toList()),
      ),
    );
  }
}
