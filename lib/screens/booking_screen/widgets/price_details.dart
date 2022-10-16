import 'package:flutter/material.dart';

import 'package:hotel_motel/data/models/booking_model.dart';
import 'package:hotel_motel/data/models/room_model.dart';
import 'package:hotel_motel/theme/design_system.dart';

class PriceDetails extends StatelessWidget {
  final Room room;
  final Booking booking;
  const PriceDetails({
    Key? key,
    required this.room,
    required this.booking,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _range = DateTimeRange(start: booking.startTime, end: booking.endTime);
    return Column(
      children: [
        _row(Icons.money, "Total Price:",
            "${(_range.duration.inDays * room.price).truncate()} PLN"),
        const SizedBox(height: Insets.xs),
        _row(Icons.payment, "Peytment: ", booking.payment),
      ],
    );
  }

  Widget _row(IconData icon, String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(icon),
            const SizedBox(width: Insets.xs),
            Text(
              label,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ],
        ),
        Text(
          value,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.blue[900]),
        )
      ],
    );
  }
}
