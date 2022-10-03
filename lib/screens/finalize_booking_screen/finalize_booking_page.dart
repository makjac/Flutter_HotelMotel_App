import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hotel_motel/data/models/search_cryteria.dart';
import 'package:hotel_motel/screens/finalize_booking_screen/utils/finalize_booking_arguments.dart';
import 'package:hotel_motel/screens/finalize_booking_screen/widgets/booking_details/finalize_booking_details.dart';
import 'package:hotel_motel/screens/finalize_booking_screen/widgets/client_details/finalize_client_details.dart';
import 'package:hotel_motel/screens/finalize_booking_screen/widgets/peytment/finalize_paytment_method.dart';
import 'package:hotel_motel/theme/theme_base.dart';

class FinalizeBookingPage extends StatefulWidget {
  FinalizeBookingArguments _arguments;

  FinalizeBookingPage({required FinalizeBookingArguments arguments, super.key})
      : _arguments = arguments {
    if (arguments.cryteria == null) {
      _arguments.cryteria = SearchCryteria(
          location: arguments.hotel.city,
          timeRange: DateTimeRange(
              start: DateTime.now().add(Duration(days: 1)),
              end: DateTime.now().add(Duration(days: 2))),
          rooms: 1,
          adults: 1,
          kids: 0);
    }
  }

  @override
  State<FinalizeBookingPage> createState() => _FinalizeBookingPageState();
}

class _FinalizeBookingPageState extends State<FinalizeBookingPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("Finalize booking"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(Insets.s),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              FinalizeBookingDetails(
                hotel: widget._arguments.hotel,
                room: widget._arguments.room,
                cryteria: widget._arguments.cryteria,
                updateTimeRange: _updateTimeRange,
              ),
              const SizedBox(height: Insets.s),
              FinalizeClientDetails(),
              const SizedBox(height: Insets.s),
              FinalizePaytmentMethods(),
              Center(
                  child: ElevatedButton(
                      onPressed: () {}, child: const Text("Book a trip!"))),
            ],
          ),
        ),
      ),
    ));
  }

  void _updateTimeRange() {
    showDateRangePicker(
            context: context,
            initialDateRange: widget._arguments.cryteria!.timeRange,
            firstDate: DateTime.now(),
            lastDate: DateTime(2220))
        .then((dateRange) {
      if (dateRange != null) {
        setState(() {
          widget._arguments.cryteria!.timeRange = dateRange;
        });
      }
    });
  }
}
