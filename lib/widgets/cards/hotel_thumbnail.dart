// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:hotel_motel/data/models/thumbnail_room_model.dart';
import 'package:hotel_motel/theme/colors.dart';
import 'package:hotel_motel/theme/design_system.dart';
import 'package:hotel_motel/widgets/containers/number_box.dart';

class HotelThumbnail extends StatelessWidget {
  final HotelLite hotel;

  const HotelThumbnail({
    Key? key,
    required this.hotel,
  }) : super(key: key);

  double _discountNull() {
    if (hotel.discount == null) {
      return 0;
    }
    return hotel.discount!;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 1,
              child: Image.network(
                "https://pliki.propertydesign.pl/i/12/62/06/126206_r0_300.jpg",
                fit: BoxFit.fitHeight,
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _title(),
                    const SizedBox(height: Insets.xs),
                    _price(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _title() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          hotel.title,
          softWrap: false,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
        ),
        const SizedBox(height: Insets.xs),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            NumberBox(number: hotel.rating),
            const SizedBox(width: Insets.xs),
            _stars(),
          ],
        ),
      ],
    );
  }

  Widget _stars() {
    return RatingBar(
      itemCount: 5,
      initialRating: hotel.rating,
      direction: Axis.horizontal,
      allowHalfRating: true,
      ignoreGestures: true,
      itemSize: 23,
      ratingWidget: RatingWidget(
        empty:
            Icon(Icons.star_border_rounded, color: InsetsColors.emptyStarColor),
        half: Icon(Icons.star_half_rounded, color: InsetsColors.halfStarColor),
        full: Icon(Icons.star_rounded, color: InsetsColors.fullStarColor),
      ),
      onRatingUpdate: (value) {},
    );
  }

  Widget _price() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            hotel.discount == null
                ? Container()
                : Text(
                    "PLN ${hotel.price.round().toString()}",
                    style: const TextStyle(
                        color: Colors.red,
                        decoration: TextDecoration.lineThrough,
                        fontSize: 12),
                  ),
            const SizedBox(width: 5),
            Text(
              "PLN ${(hotel.price * ((100 - _discountNull()) / 100)).round().toString()}",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            )
          ],
        ),
        const Text(
          "Includes fees and taxes",
          style: TextStyle(color: Colors.grey, fontSize: 10),
        ),
        hotel.isFreeCanceling ? _freeCnceling() : Container(),
      ],
    );
  }

  Widget _freeCnceling() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: const [
        Icon(
          Icons.check_circle_outline_outlined,
          color: Colors.green,
          size: 13,
        ),
        SizedBox(width: 3),
        Text(
          "Free cancellation",
          style: TextStyle(color: Colors.green, fontSize: 10),
        )
      ],
    );
  }
}
