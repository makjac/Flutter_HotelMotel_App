import 'package:flutter/material.dart';

import 'package:hotel_motel/models/hotel_model.dart';
import 'package:hotel_motel/models/room_model.dart';
import 'package:hotel_motel/models/search_cryteria.dart';
import 'package:hotel_motel/screens/finalize_booking_screen/widgets/booking_details/booking_deadline.dart';
import 'package:hotel_motel/screens/finalize_booking_screen/widgets/booking_details/hotel_details.dart';
import 'package:hotel_motel/screens/finalize_booking_screen/widgets/finalize_header.dart';

import '../../../../theme/design_system.dart';

class FinalizeBookingDetails extends StatelessWidget {
  final Hotel hotel;
  final Room room;
  final SearchCryteria? cryteria;
  final VoidCallback updateTimeRange;
  const FinalizeBookingDetails({
    Key? key,
    required this.hotel,
    required this.room,
    this.cryteria,
    required this.updateTimeRange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Insets.s),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FinalizeHeader(label: "Booking details"),
          const SizedBox(height: Insets.xs),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              (cryteria != null)
                  ? BookingDedline(
                      bookingRnage: cryteria!.timeRange,
                      updateTimeRange: updateTimeRange,
                    )
                  : BookingDedline(
                      bookingRnage: DateTimeRange(
                          start: DateTime.now().add(Duration(days: 1)),
                          end: DateTime.now().add(Duration(days: 2))),
                      updateTimeRange: updateTimeRange,
                    ),
              const SizedBox(height: Insets.m),
              HotelDetails(hotel: hotel),
            ],
          ),
        ],
      ),
    );
  }
}
