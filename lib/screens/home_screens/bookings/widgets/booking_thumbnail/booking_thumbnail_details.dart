// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:hotel_motel/data/models/booking_model.dart';
import 'package:hotel_motel/data/models/hotel_model.dart';
import 'package:hotel_motel/theme/theme_base.dart';
import 'package:hotel_motel/utils/date.dart';
import 'package:hotel_motel/widgets/score_bars/number_box.dart';

class BookingThumbnailDetails extends StatelessWidget {
  final Booking booking;
  final Hotel hotel;

  const BookingThumbnailDetails({
    Key? key,
    required this.booking,
    required this.hotel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            NumberBox(number: hotel.rating / 20),
            const SizedBox(width: Insets.xs),
            Text(
                "${Date.shortenDateToString(booking.startTime)} - ${Date.shortenDateToString(booking.endTime)}")
          ],
        ),
      ],
    );
  }
}
