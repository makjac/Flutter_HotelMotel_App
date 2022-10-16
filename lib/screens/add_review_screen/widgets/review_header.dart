import 'package:flutter/material.dart';
import 'package:hotel_motel/utils/scale.dart';

class ReviewHeader extends StatelessWidget {
  final String label;
  const ReviewHeader({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Text(
      label,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      textScaleFactor: Scale.textScale(width, 2),
    );
  }
}
