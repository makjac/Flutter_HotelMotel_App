import 'package:flutter/material.dart';
import 'package:hotel_motel/models/hotel_model.dart';

import '../../../theme/design_system.dart';
import '../../../utils/scale.dart';
import '../../../widgets/score_bars/number_box.dart';

class HotelPageTitle extends StatelessWidget {
  final Hotel hotel;
  const HotelPageTitle({required this.hotel, super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                hotel.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
                textScaleFactor: Scale.textScale(width, 1.5),
              ),
              const SizedBox(height: Insets.xs),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.location_on,
                    color: Colors.grey,
                    size: 18,
                  ),
                  const SizedBox(width: 2),
                  Text(
                    "${hotel.country}, ${hotel.city}",
                    style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Colors.grey),
                    textScaleFactor: Scale.textScale(width, 1.5),
                  ),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: NumberBox(
              number: (hotel.rating / 100) * 5,
              textPadding: 5,
              textScale: 1.3,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
