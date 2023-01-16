import 'package:flutter/material.dart';

import 'package:hotel_motel/models/booking_model.dart';
import 'package:hotel_motel/models/hotel_model.dart';

import '../../../../../theme/design_system.dart';
import 'booking_thumbnail_details.dart';
import 'booking_thumbnail_title.dart';

class BookingThumbnailContent extends StatelessWidget {
  final Booking booking;
  final Hotel hotel;

  const BookingThumbnailContent({
    Key? key,
    required this.booking,
    required this.hotel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 1,
            child: Image.network(
              hotel.images[0],
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(Insets.xs),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BookingThumbnailTitle(
                    hotel: hotel,
                  ),
                  const SizedBox(height: Insets.s),
                  BookingThumbnailDetails(
                    booking: booking,
                    hotel: hotel,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
