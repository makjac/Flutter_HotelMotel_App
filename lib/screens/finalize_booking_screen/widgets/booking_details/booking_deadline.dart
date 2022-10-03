import 'package:flutter/material.dart';

import '../../../../theme/design_system.dart';
import '../../../../utils/date.dart';

class BookingDedline extends StatelessWidget {
  final DateTimeRange bookingRnage;
  final VoidCallback updateTimeRange;
  const BookingDedline({
    Key? key,
    required this.bookingRnage,
    required this.updateTimeRange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 10,
          child: _dates(),
        ),
        Expanded(
          flex: 2,
          child: IconButton(
            onPressed: () {
              updateTimeRange();
            },
            icon: Icon(Icons.edit),
          ),
        ),
      ],
    );
  }

  Widget _dates() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IntrinsicHeight(
          child: Row(
            children: <Widget>[
              _dateLabel("Check-in", bookingRnage.start),
              const VerticalDivider(
                width: 35,
                thickness: 2,
                indent: 2,
                endIndent: 2,
                color: Colors.black38,
              ),
              _dateLabel("Check-out", bookingRnage.end),
            ],
          ),
        ),
        const SizedBox(height: Insets.xs),
        _stayLength(),
      ],
    );
  }

  Widget _dateLabel(String label, DateTime date) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        Text(
          Date.shortenDateToString(date),
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _stayLength() {
    return Text(
      "Total length of stay: ${bookingRnage.duration.inDays} days",
      style: TextStyle(fontWeight: FontWeight.w500),
    );
  }
}
