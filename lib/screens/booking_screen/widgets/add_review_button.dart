// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hotel_motel/constans/route_name_constans.dart';

import 'package:hotel_motel/data/models/booking_thumbnail_model.dart';
import 'package:hotel_motel/theme/theme_base.dart';

class AddreviewButton extends StatelessWidget {
  final BookingThumbnailModel bookingDetails;
  const AddreviewButton({
    Key? key,
    required this.bookingDetails,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (bookingDetails.booking.opinion == "none") {
      if (bookingDetails.booking.status == "active") {
        if (bookingDetails.booking.startTime.isBefore(DateTime.now())) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: Insets.s),
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
                    Navigator.pushNamed(context, AppRoute.ADD_REVIEW_ROUTE,
                        arguments: bookingDetails);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.reviews),
                      SizedBox(width: Insets.xs),
                      const Text("Add review"),
                    ],
                  )),
            ),
          );
        }
      }
    }
    return Container();
  }
}
