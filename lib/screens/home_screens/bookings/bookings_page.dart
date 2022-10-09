import 'package:flutter/material.dart';
import 'package:hotel_motel/screens/home_screens/bookings/cancelled/cancelled_bookings.dart';
import 'package:hotel_motel/screens/home_screens/bookings/incoming/incoming_bookins.dart';
import 'package:hotel_motel/screens/home_screens/bookings/realized/realized_bookings.dart';
import 'package:hotel_motel/screens/home_screens/bookings/widgets/bookings_tab_bar.dart';
import 'package:hotel_motel/theme/theme_base.dart';

class BookingsPage extends StatefulWidget {
  const BookingsPage({Key? key}) : super(key: key);

  @override
  State<BookingsPage> createState() => _BookingsPageState();
}

class _BookingsPageState extends State<BookingsPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Bookings"),
          backgroundColor: InsetsColors.abBackgroundColor,
          centerTitle: true,
          bottom: PreferredSize(
            child: BookingTabBar(),
            preferredSize: Size(double.infinity, 35),
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            const IncomingBooking(),
            const RealizedBooking(),
            const CancelledBookings(),
          ],
        ),
      ),
    );
  }
}
