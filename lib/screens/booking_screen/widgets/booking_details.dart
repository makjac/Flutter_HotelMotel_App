// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:hotel_motel/data/models/booking_model.dart';
import 'package:hotel_motel/theme/design_system.dart';
import 'package:hotel_motel/utils/date.dart';

class BookingDetails extends StatelessWidget {
  final Booking booking;
  const BookingDetails({
    Key? key,
    required this.booking,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _range = DateTimeRange(start: booking.startTime, end: booking.endTime);
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Icon(Icons.calendar_month),
        ),
        Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${_range.duration.inDays} Days",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "${Date.shortenDateToString(booking.startTime)} - ${Date.shortenDateToString(booking.endTime)}",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: Insets.xs),
                const Text(
                  "Check-in: 14:00 pm",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                const Text(
                  "Check-out: 10:00 am",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ],
            ))
      ],
    );
  }
}
