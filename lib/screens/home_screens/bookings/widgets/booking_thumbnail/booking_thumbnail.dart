import 'package:flutter/material.dart';
import 'package:hotel_motel/screens/home_screens/bookings/widgets/booking_thumbnail/booking_thumbnail_title.dart';

import '../../../../../theme/colors.dart';
import '../../../../../theme/design_system.dart';

class BookingThumbnail extends StatelessWidget {
  const BookingThumbnail({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      splashColor: InsetsColors.splashColor,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Card(
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: 1,
                  child: Image.network(
                    "https://pliki.propertydesign.pl/i/12/62/06/126206_r0_300.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(Insets.xs),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BookingThumbnailTitle(),
                        const SizedBox(height: Insets.xs),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
