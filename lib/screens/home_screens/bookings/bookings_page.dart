import 'package:flutter/material.dart';
import 'package:hotel_motel/theme/theme_base.dart';

class BookingsPage extends StatefulWidget {
  const BookingsPage({Key? key}) : super(key: key);

  @override
  State<BookingsPage> createState() => _BookingsPageState();
}

class _BookingsPageState extends State<BookingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: InsetsColors.backgroundColor,
      appBar: AppBar(
        title: const Text("Bookings"),
        backgroundColor: InsetsColors.abBackgroundColor,
        centerTitle: true,
      ),
    );
  }
}
