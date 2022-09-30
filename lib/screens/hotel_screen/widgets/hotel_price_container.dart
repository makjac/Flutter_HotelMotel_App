import 'package:flutter/material.dart';

import '../../../theme/design_system.dart';
import '../../../utils/scale.dart';

class HotelPriceContainer extends StatelessWidget {
  final num priceUnit;
  final int nights;
  final int roomCount;
  final int adultsCount;
  final int? kidsCount;
  const HotelPriceContainer({
    Key? key,
    required this.priceUnit,
    required this.nights,
    required this.roomCount,
    required this.adultsCount,
    this.kidsCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
              blurRadius: 10,
              spreadRadius: 2,
              color: Colors.grey,
              offset: Offset(7, 7))
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(Insets.s),
        child: InkWell(
          onTap: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Price for $nights nights, $roomCount rooms",
                    textScaleFactor: Scale.textScale(width, 1.3),
                    style: const TextStyle(fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(height: Insets.xs),
                  Text(
                    //todo: set room name
                    "Deluxe",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 22),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    textScaleFactor: Scale.textScale(width, 1.5),
                  ),
                  const SizedBox(height: Insets.xs),
                  Text(
                    "PLN ${priceUnit * nights}",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 22),
                    textScaleFactor: Scale.textScale(width, 1.5),
                  ),
                  const SizedBox(height: Insets.xs),
                  Text(
                    "Includes fees and taxes",
                    textScaleFactor: Scale.textScale(width, 1.3),
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
              const Icon(
                Icons.chevron_right_rounded,
                size: 40,
              )
            ],
          ),
        ),
      ),
    );
  }
}
