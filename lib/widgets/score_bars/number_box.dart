// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:hotel_motel/theme/colors.dart';
import 'package:hotel_motel/utils/scale.dart';

// ignore: must_be_immutable
class NumberBox extends StatelessWidget {
  final double number;
  Color color;
  double textPadding;
  double textScale;
  NumberBox({
    Key? key,
    required this.number,
    this.color = Colors.brown,
    this.textPadding = 3,
    this.textScale = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(5)),
      child: Padding(
        padding: EdgeInsets.all(textPadding),
        child: Center(
          child: Text(
            number.toStringAsFixed(1).toString(),
            textScaleFactor: Scale.textScale(width, 1.3) * textScale,
            style: const TextStyle(color: InsetsColors.eButTextColor),
          ),
        ),
      ),
    );
  }
}
