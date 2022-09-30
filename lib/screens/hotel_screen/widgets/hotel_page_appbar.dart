// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/rendering/sliver_persistent_header.dart';

class HotelPageAppbar implements SliverPersistentHeaderDelegate {
  final double _minExtent;
  final double _maxExtent;
  HotelPageAppbar({
    double? minExtent,
    double? maxExtent,
  })  : _maxExtent = maxExtent ?? 250.0,
        _minExtent = minExtent ?? 50;

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
          child: Container(
            //todo: ste hotel page image slider
            color: Colors.blue,
          ),
        ),
        Positioned(
          top: 1,
          left: 2,
          child: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back),
            color: Colors.white,
          ),
        )
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
}
