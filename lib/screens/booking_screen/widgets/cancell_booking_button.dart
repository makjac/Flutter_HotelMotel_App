// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:hotel_motel/data/models/booking_model.dart';
import 'package:hotel_motel/theme/theme_base.dart';

class CancellBookingButton extends StatelessWidget {
  final Booking booking;
  const CancellBookingButton({
    Key? key,
    required this.booking,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (booking.status == "active") {
      if (booking.startTime.isAfter(DateTime.now())) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: Insets.xl),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateColor.resolveWith((states) {
                    if (states.contains(MaterialState.pressed)) {
                      return Color.fromARGB(255, 33, 33, 33);
                    }
                    return Colors.black;
                  }),
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text("Are you sure?"),
                      content: const Text(
                          "Are you sure you want to cancel your booking?"),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text(
                            "No",
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                        TextButton(
                          onPressed: () async {
                            await FirebaseFirestore.instance
                                .collection('booking')
                                .doc(booking.bookingID)
                                .update({'status': 'inactive'});
                            Navigator.pop(context);
                          },
                          child: const Text("Yes"),
                        ),
                      ],
                    ),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.cancel),
                    SizedBox(width: Insets.xs),
                    const Text("Cancell booking"),
                  ],
                )),
          ),
        );
      }
    }
    return Container();
  }
}
