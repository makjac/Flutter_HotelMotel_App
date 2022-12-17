// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hotel_motel/theme/theme_base.dart';
import 'package:hotel_motel/utils/date.dart';

import '../../../../bloc/hotelAppbar/hotel_appbar_bloc.dart';
import '../../../../locator.dart';
import '../../../controller/user/user_controller.dart';
import '../../../models/booking_model.dart';
import '../../../models/hotel_model.dart';

class ReviewAppbar extends SliverPersistentHeaderDelegate {
  final Booking booking;
  final Hotel hotel;
  final double _minExtent;
  final double _maxExtent;
  bool isFavorite;
  ReviewAppbar({
    double? minExtent,
    double? maxExtent,
    required this.booking,
    required this.hotel,
  })  : _minExtent = minExtent ?? 50.0,
        _maxExtent = maxExtent ?? 300.0,
        isFavorite =
            locator.get<UserController>().isHotelUserFavorite(hotel.hotelID);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    var bookingDateRange =
        DateTimeRange(start: booking.startTime, end: booking.endTime);
    final progress = shrinkOffset / maxExtent;
    return BlocProvider(
      create: (context) => HotelAppbarBloc(),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      "https://www.hotel-cyprus.pl/thumb?file=hotel-cyprus%2Fuser%2Fhotel%2Fnowe.jpg&w=1920")),
            ),
          ),
          Positioned.fill(
            top: 200 - shrinkOffset,
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    color: Colors.white12,
                    height: 100,
                    width: double.infinity,
                  ),
                ),
              ),
            ),
          ),
          Positioned.fill(
            bottom: 10,
            left: 10,
            child: AnimatedOpacity(
              opacity: 1 - progress,
              duration: const Duration(milliseconds: 150),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        hotel.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 23,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: Insets.xs),
                      Text(
                        "${bookingDateRange.duration.inDays} nights in ${hotel.city}",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        "${Date.shortenDateToString(booking.startTime)} - ${Date.shortenDateToString(booking.endTime)}",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          AnimatedOpacity(
            opacity: progress,
            duration: const Duration(milliseconds: 150),
            child: Container(
              color: Colors.black,
            ),
          ),
          Positioned(
            child: IconButton(
              color: Colors.white,
              onPressed: () => Navigator.pop(context),
              icon: Icon(Icons.arrow_back),
            ),
          ),
          Positioned(
            top: 1,
            right: 10,
            child: BlocBuilder<HotelAppbarBloc, HotelAppbarState>(
              builder: (context, state) {
                if (state is AddedFavorite) {
                  return IconButton(
                    iconSize: 30,
                    color: Colors.red,
                    tooltip: "Remove favorite",
                    icon: Icon(Icons.favorite),
                    onPressed: () => _setFavorite(context),
                  );
                }
                if (state is RemovedFavorite) {
                  return IconButton(
                    iconSize: 30,
                    color: Colors.grey,
                    tooltip: "Add to favorite",
                    icon: Icon(Icons.favorite_border),
                    onPressed: () => _setFavorite(context),
                  );
                }
                return IconButton(
                  iconSize: 30,
                  color: isFavorite ? Colors.red : Colors.grey,
                  tooltip: "Add to favorite",
                  icon: isFavorite
                      ? Icon(Icons.favorite)
                      : Icon(Icons.favorite_border),
                  onPressed: () => _setFavorite(context),
                );
              },
            ),
          ),
        ],
      ),
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

  void _setFavorite(BuildContext context) {
    if (isFavorite) {
      BlocProvider.of<HotelAppbarBloc>(context)
          .add(RemoveFavoriteHotel(hotelID: hotel.hotelID));
      isFavorite = !isFavorite;
    } else {
      BlocProvider.of<HotelAppbarBloc>(context)
          .add(AddFavoriteHotel(hotelID: hotel.hotelID));
      isFavorite = !isFavorite;
    }
  }
}
