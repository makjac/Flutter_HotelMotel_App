// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:hotel_motel/screens/home_screens/bookings/widgets/booking_thumbnail/booking_thumbnail.dart';

import '../../../../data/models/booking_thumbnail_model.dart';
import '../../../../theme/design_system.dart';

class CancelledBookings extends StatelessWidget {
  final List<BookingThumbnailModel> thumbnails;

  CancelledBookings({
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
                .where((booking) => booking.booking.status == "inactive")
                .map((booking) => BookingThumbnail(booking: booking))
                .toList()),
      ),
    );
  }
}
