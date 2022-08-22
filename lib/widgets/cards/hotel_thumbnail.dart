// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hotel_motel/constans/route_name_constans.dart';

import 'package:hotel_motel/data/models/thumbnail_room_model.dart';
import 'package:hotel_motel/theme/colors.dart';
import 'package:hotel_motel/theme/design_system.dart';
import 'package:hotel_motel/utils/scale.dart';
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
    final width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, AppRoute.HOTEL_ROUTE);
      },
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
                        _title(width),
                        const SizedBox(height: Insets.xs),
                        _price(width),
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

  Widget _title(double width) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          hotel.title,
          softWrap: false,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          textScaleFactor: Scale.textScale(width, 1.7),
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
        ),
        const SizedBox(height: Insets.xs),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            NumberBox(number: hotel.rating),
            const SizedBox(width: Insets.xs),
            _stars(width),
          ],
        ),
      ],
    );
  }

  Widget _stars(double width) {
    return RatingBar(
      itemCount: 5,
      initialRating: hotel.rating,
      direction: Axis.horizontal,
      allowHalfRating: true,
      ignoreGestures: true,
      itemSize: 23 * Scale.textScale(width, 1.3),
      ratingWidget: RatingWidget(
        empty:
            Icon(Icons.star_border_rounded, color: InsetsColors.emptyStarColor),
        half: Icon(Icons.star_half_rounded, color: InsetsColors.halfStarColor),
        full: Icon(Icons.star_rounded, color: InsetsColors.fullStarColor),
      ),
      onRatingUpdate: (value) {},
    );
  }

  Widget _price(double width) {
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
                    textScaleFactor: Scale.textScale(width, 1.4),
                    style: const TextStyle(
                        color: Colors.red,
                        decoration: TextDecoration.lineThrough,
                        fontSize: 12),
                  ),
            const SizedBox(width: 5),
            Text(
              "PLN ${(hotel.price * ((100 - _discountNull()) / 100)).round().toString()}",
              textScaleFactor: Scale.textScale(width, 1.4),
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            )
          ],
        ),
        Text(
          "Includes fees and taxes",
          textScaleFactor: Scale.textScale(width, 1.3),
          style: const TextStyle(color: Colors.grey, fontSize: 10),
        ),
        hotel.isFreeCanceling ? _freeCnceling(width) : Container(),
      ],
    );
  }

  Widget _freeCnceling(double width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const Icon(
          Icons.check_circle_outline_outlined,
          color: Colors.green,
          size: 13,
        ),
        const SizedBox(width: 3),
        Text(
          "Free cancellation",
          textScaleFactor: Scale.textScale(width, 1.3),
          style: const TextStyle(color: Colors.green, fontSize: 10),
        )
      ],
    );
  }
}
