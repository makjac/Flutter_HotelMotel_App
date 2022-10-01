// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/rendering/sliver_persistent_header.dart';
import 'package:hotel_motel/data/models/hotel_model.dart';
import 'package:hotel_motel/locator.dart';
import 'package:hotel_motel/screens/hotel_screen/widgets/hotel_image_carousel.dart';

import '../../../data/controller/user/user_controller.dart';

class HotelPageAppbar implements SliverPersistentHeaderDelegate {
  final double _minExtent;
  final double _maxExtent;
  final Hotel hotel;
  bool isFavorite;
  HotelPageAppbar({
    double? minExtent,
    double? maxExtent,
    required this.hotel,
  })  : _maxExtent = maxExtent ?? 300.0,
        _minExtent = minExtent ?? 50,
        isFavorite =
            locator.get<UserController>().isHotelUserFavorite(hotel.hotelID);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final progress = shrinkOffset / maxExtent;
    return Stack(
      fit: StackFit.expand,
      children: [
        AnimatedOpacity(
          opacity: progress,
          duration: const Duration(milliseconds: 150),
          child: Container(
            //todo: set correct color
            color: Colors.black,
          ),
        ),
        AnimatedOpacity(
          opacity: 1 - progress,
          duration: const Duration(milliseconds: 150),
          child: SingleChildScrollView(
              child: HotelImageCarousel(height: _maxExtent)),
        ),
        Positioned(
          top: 0,
          left: 2,
          child: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back),
            color: Colors.white,
          ),
        ),
        Positioned(
          top: 1,
          right: 10,
          child: IconButton(
            iconSize: 30,
            color: isFavorite ? Colors.red : Colors.grey,
            tooltip: "Add to favorite",
            icon:
                isFavorite ? Icon(Icons.favorite) : Icon(Icons.favorite_border),
            onPressed: () => _setFavorite(),
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => _maxExtent;

  @override
  double get minExtent => _minExtent;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  @override
  PersistentHeaderShowOnScreenConfiguration? get showOnScreenConfiguration =>
      null;

  @override
  FloatingHeaderSnapConfiguration? get snapConfiguration => null;

  @override
  OverScrollHeaderStretchConfiguration? get stretchConfiguration => null;

  @override
  TickerProvider? get vsync => null;

  void _setFavorite() {
    if (isFavorite) {
      var result =
          locator.get<UserController>().removeFavoriteHotel(hotel.hotelID);
      result.then((value) {
        if (value) isFavorite = false;
      });
    } else {
      var result =
          locator.get<UserController>().addFavoriteHotel(hotel.hotelID);
      result.then((value) {
        if (value) isFavorite = true;
      });
    }
  }
}
