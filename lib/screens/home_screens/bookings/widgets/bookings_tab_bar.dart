import 'package:flutter/material.dart';

import 'booking_tab_label.dart';

class BookingTabBar extends StatelessWidget {
  const BookingTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      isScrollable: true,
      indicatorColor: Colors.white,
      unselectedLabelColor: Colors.white38,
      unselectedLabelStyle: TextStyle(fontSize: 12),
      labelStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      tabs: [
        BookingTabLabel(label: "Incoming", icons: Icons.next_plan_sharp),
        BookingTabLabel(label: "Realized", icons: Icons.check_circle),
        BookingTabLabel(label: "Cancelled", icons: Icons.cancel),
      ],
    );
  }
}
