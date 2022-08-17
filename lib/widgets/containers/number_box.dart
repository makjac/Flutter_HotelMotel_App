// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:hotel_motel/theme/colors.dart';
import 'package:hotel_motel/utils/scale.dart';

class NumberBox extends StatelessWidget {
  final double number;
  const NumberBox({
    Key? key,
    required this.number,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
          color: Colors.brown, borderRadius: BorderRadius.circular(5)),
      child: Padding(
        padding: const EdgeInsets.all(3),
        child: Text(
          number.toStringAsFixed(1).toString(),
          textScaleFactor: Scale.textScale(width, 1.3),
          style: const TextStyle(color: InsetsColors.eButTextColor),
        ),
      ),
    );
  }
}
