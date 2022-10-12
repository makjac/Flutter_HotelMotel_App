// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:hotel_motel/data/models/booking_model.dart';
import 'package:hotel_motel/data/models/hotel_model.dart';

import '../../../../../theme/design_system.dart';
import '../../../../../utils/scale.dart';
import '../../../../../widgets/score_bars/number_box.dart';

class BookingThumbnailTitle extends StatelessWidget {
  final Booking booking;
  final Hotel hotel;

  const BookingThumbnailTitle({
    Key? key,
    required this.booking,
    required this.hotel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          hotel.name,
          softWrap: false,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          textScaleFactor: Scale.textScale(width, 1.7),
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 17,
          ),
        ),
        const SizedBox(height: Insets.xs),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            NumberBox(number: hotel.rating / 20),
            const SizedBox(width: Insets.xs),
          ],
        ),
      ],
    );
  }
}
