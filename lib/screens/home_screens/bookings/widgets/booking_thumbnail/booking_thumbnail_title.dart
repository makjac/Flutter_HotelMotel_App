import 'package:flutter/material.dart';

import '../../../../../theme/design_system.dart';
import '../../../../../utils/scale.dart';
import '../../../../../widgets/score_bars/number_box.dart';

class BookingThumbnailTitle extends StatelessWidget {
  const BookingThumbnailTitle({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          //todo : add hotel variable
          "Hotel zielona róza",
          softWrap: false,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          textScaleFactor: Scale.textScale(width, 1.7),
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 17,
          ),
        ),
        const SizedBox(height: Insets.xs),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //todo: add hotel variable
            NumberBox(number: 100 / 20),
            const SizedBox(width: Insets.xs),
          ],
        ),
      ],
    );
  }
}
