// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:hotel_motel/data/models/hotel_model.dart';
import 'package:hotel_motel/data/models/hotel_thumbnail_model.dart';
import 'package:hotel_motel/data/models/room_model.dart';
import 'package:hotel_motel/theme/theme_base.dart';
import 'package:hotel_motel/widgets/cards/hotel_thumbnail.dart';

class HotelDetails extends StatelessWidget {
  final Hotel hotel;
  final Room room;
  const HotelDetails({
    Key? key,
    required this.hotel,
    required this.room,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          hotel.name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 23,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: Insets.s),
        HotelThumbnail(
            hotel: HotelThumbnailModel(
          hotelID: hotel.hotelID,
          name: hotel.name,
          discount: room.discount,
          isFeeCanceling: hotel.isFreeCanceling,
          price: room.price,
          rating: hotel.rating,
        ))
      ],
    );
  }
}
