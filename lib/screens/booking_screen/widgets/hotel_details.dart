// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:hotel_motel/models/hotel_model.dart';
import 'package:hotel_motel/models/hotel_thumbnail_model.dart';
import 'package:hotel_motel/models/room_model.dart';
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
    return Padding(
      padding:
          const EdgeInsets.only(left: Insets.s, right: Insets.s, top: Insets.s),
      child: Column(
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
            ),
          ),
        ],
      ),
    );
  }
}
