// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../../theme/design_system.dart';

class BookingTabLabel extends StatelessWidget {
  final String label;
  final IconData icons;
  const BookingTabLabel({
    Key? key,
    required this.label,
    required this.icons,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: <Widget>[
          Icon(
            icons,
            size: 20,
          ),
          SizedBox(width: Insets.xs),
          Text(label),
        ],
      ),
    );
  }
}
