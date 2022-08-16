// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:hotel_motel/theme/colors.dart';

class NumberBox extends StatelessWidget {
  final double number;
  const NumberBox({
    Key? key,
    required this.number,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.brown, borderRadius: BorderRadius.circular(5)),
      child: Padding(
        padding: const EdgeInsets.all(3),
        child: Text(
          number.toStringAsFixed(1).toString(),
          style: const TextStyle(color: InsetsColors.eButTextColor),
        ),
      ),
    );
  }
}
