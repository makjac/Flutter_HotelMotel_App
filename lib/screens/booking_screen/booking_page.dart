// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:hotel_motel/data/models/booking_thumbnail_model.dart';

class BookingPage extends StatelessWidget {
  final BookingThumbnailModel details;
  const BookingPage({
    Key? key,
    required this.details,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Booking details"),
          centerTitle: true,
        ),
        body: Center(
          child: const Text("Booking page"),
        ),
      ),
    );
  }
}
